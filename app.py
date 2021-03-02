#!/usr/bin/python3

from flask import Flask, request, redirect, url_for, render_template, flash
from flask_login import LoginManager, login_user, logout_user, current_user, login_required
from operate_user import User, query_user, register_user
from operate_data import select_operaction, insert_operaction,update_operaction
import random
#from operate_str import reStr, fanToJian, deCodeList
import hashlib
import time
from operate_role import query_role_exist
from fu_tools import get_wuxing, trans_to_list_from_str

app = Flask(__name__)
app.secret_key = '1234567'
login_manager = LoginManager()
login_manager.login_view = 'login'
login_manager.login_message_category = 'info'
login_manager.login_message = '请登录'
login_manager.init_app(app)


@login_manager.user_loader
def load_user(user_id):
    if query_user(user_id) is not None:
        curr_user = User()
        curr_user.id = user_id
        return curr_user


@app.route('/', methods=['POST', 'GET'])
@login_required
def index():
    index_str = select_operaction("conf_value", "conf", "conf_key='world_id'")[
        0][0].decode('UTF-8')

    return render_template('index.html', index_str=index_str)


@app.route('/user', methods=['POST', 'GET'])
@login_required
def user():
    username = current_user.get_id()
    role_id = select_operaction(
        "r.id", "role r,user u", "u.user=\""+username+"\" and r.user_id=u.id")
    print("role_id = ")
    print(role_id)
    if role_id == []:
        return redirect(url_for('schoolinfo'))
    role_dict={}
    role_status = select_operaction('*','role','id=' + str(role_id[0][0]))[0]
    role_dict['name']=role_status[2].decode('UTF-8')
    role_dict['level']=role_status[3]
    role_dict['experience']=role_status[4]
    role_dict['school']= select_operaction('name','school','id = ' + str(role_status[5]))[0][0].decode('UTF-8')
    role_dict['skill']= select_operaction('name','skill','id = ' + str(role_status[7]))[0][0].decode('UTF-8')

    role_dict['max_hp']=role_status[9]
    role_dict['hp']=role_status[8]
    role_dict['max_mp']=role_status[11]
    role_dict['mp']=role_status[10]
 

    return render_template('user.html',role_dict=role_dict)


@app.route('/createrole', methods=['POST', 'GET'])
@login_required
def createrole():
    schools = select_operaction("id,name", "school")
    schools_dict = {}
    for byte_str in schools:
        schools_dict[byte_str[0]] = byte_str[1].decode('UTF-8')
    return render_template('createrole.html', schools_dict=schools_dict)


@app.route('/createrole_success', methods=['POST'])
@login_required
def createrole_success():
    G_rolename = request.form.get('rolename')
    G_roleschool_id = request.form.get('roleschool')
    print(G_rolename)
    if G_rolename is None:
        R_message = "角色名为空，请重新注册"
        return render_template('createrole_error.html', R_message=R_message)
    S_role_str = query_role_exist(G_rolename)
    if S_role_str is False:
        R_message = "角色名已存在，请重新注册"
        return render_template('createrole_error.html', R_message=R_message)
    wuxing_dict = get_wuxing()
    school_wuxing_list_code = select_operaction(
        'wuxing', 'school', 'id=\''+G_roleschool_id+'\'')
    school_wuxing_list = trans_to_list_from_str(school_wuxing_list_code)
    wuxing_dict['j'] = wuxing_dict['j'] + int(school_wuxing_list[0])
    wuxing_dict['m'] = wuxing_dict['m'] + int(school_wuxing_list[1])
    wuxing_dict['s'] = wuxing_dict['s'] + int(school_wuxing_list[2])
    wuxing_dict['h'] = wuxing_dict['h'] + int(school_wuxing_list[3])
    wuxing_dict['t'] = wuxing_dict['t'] + int(school_wuxing_list[4])
    school_name = select_operaction(
        'name', 'school', 'id=\''+G_roleschool_id+'\'')[0][0].decode('UTF-8')
    m = max(int(wuxing_dict['j']), int(wuxing_dict['m']), int(
        wuxing_dict['s']), int(wuxing_dict['h']), int(wuxing_dict['t']))
    username = current_user.get_id()
    user_id = select_operaction(
        'id', 'user', 'user=\'' + username + '\'')[0][0]
    max_mp = int(wuxing_dict['s'])*300+1000
    mp = 0
    max_hp = int(wuxing_dict['m'])*100 + int(wuxing_dict['t'])*100 + 3000
    hp = max_hp
    role_keys = 'user_id,name,level,experience,school_id,bag_id,skill_id,hp,max_hp,mp,max_mp,jin,mu,shui,huo,tu'
    role_values = str(user_id) + ',\'' + G_rolename + '\',0,0,' + G_roleschool_id + ',0,' + G_roleschool_id + ','  + str(hp) + ',' + str(max_hp) + ',' + str(mp) + ',' + str(max_mp) + \
        ',' + str(wuxing_dict['j']) + ',' + str(wuxing_dict['m']) + ',' + str(
            wuxing_dict['s']) + ',' + str(wuxing_dict['h']) + ',' + str(wuxing_dict['t']) 
    insert_operaction('role', role_keys, role_values)
    role_id = select_operaction('id','role','user_id='+ str(user_id))[0][0]
    update_operaction('role','bag_id = ' + str(role_id),'id='+ str(role_id))
    insert_operaction('bag','id,money',str(role_id) + ',0')
    return render_template('createrole_success.html', rolename=G_rolename, roleschool=school_name, wuxing_dict=wuxing_dict, max=m)


@app.route('/schoolinfo', methods=['GET'])
@login_required
def schoolinfo():
    schools = select_operaction("name,info", "school")
    schools_dict = {}
    for byte_str in schools:
        schools_dict[byte_str[0].decode('UTF-8')] = byte_str[1].decode('UTF-8')
    print(schools_dict)
    return render_template('schoolinfo.html', schools_dict=schools_dict)


@app.route('/attributeinfo', methods=['GET'])
@login_required
def attributeinfo():
    attributes = select_operaction("name,info", "attribute")
    attributes_dict = {}
    for byte_str in attributes:
        attributes_dict[byte_str[0].decode(
            'UTF-8')] = byte_str[1].decode('UTF-8')
    print(attributes_dict)
    return render_template('attributeinfo.html', attributes_dict=attributes_dict)

# @app.route('/<path:post_type>/<int:post_id>')
# @login_required
# def show_post(post_type, post_id):
#    if post_type == "tangshi":
#        ZH_type = "唐诗"
#    elif post_type == "songshi":
#        ZH_type = "宋诗"
#    elif post_type == "songci":
#        ZH_type = "宋词"
#    elif post_type == "shijing":
#        ZH_type = "诗经"
#    else:
#        return redirect(url_for('index'))
#
#    S_result = select_operaction(
#        "id,title,author,paragraphs", post_type, "id = " + str(post_id))
#    S_id = S_result[0][0]
#    S_title = fanToJian(S_result[0][1].decode('UTF-8'))
#    S_author = fanToJian(S_result[0][2].decode('UTF-8'))
#    S_paragraphs = reStr(fanToJian(S_result[0][3].decode('UTF-8'))).split('\n')
#    print(S_result)
#    return render_template('read_2.html',
#                           id=S_id, title=S_title, author=S_author, paragraphsList=S_paragraphs,
#                           EN_type=post_type, ZH_type=ZH_type)


#
@app.route('/login', methods=['GET', 'POST'])
@login_required
def login():
    if request.method == 'POST':
        G_username = request.form.get('username')
        G_userpass = request.form.get('userpass')
        S_user_str = query_user(G_username)
        if S_user_str is None:
            return render_template('login_error.html')
        S_userpass_sha1 = S_user_str[0][2].decode('UTF-8')
        G_userpass_sha1 = hashlib.sha1(G_userpass.encode("utf-8")).hexdigest()
        if G_username is not None and G_userpass_sha1 == S_userpass_sha1:

            curr_user = User()
            curr_user.id = G_username
            # 通过Flask-Login的login_user方法登录用户
            login_user(curr_user)
            return redirect(url_for('index'))
        else:
            return render_template('login_error.html')
            flash('Wrong username or password!')
    # GET 请求
    return render_template('login.html')


@app.route('/logout')
@login_required
def logout():
    logout_user()
    return 'Logged out successfully!'


@app.route('/register')
def register():
    return render_template('register.html')


@app.route('/register_success', methods=['POST'])
def register_success():
    G_username = request.form.get('user')
    G_userpass = request.form.get('pass')
    G_userpass_2 = request.form.get('pass2')
    if G_username is None:
        R_message = "用户名为空，请重新注册"
        return render_template('register_error.html', R_message=R_message)
    S_user_str = query_user(G_username)
    if S_user_str is not None:
        R_message = "用户名已存在，请重新注册"
        return render_template('register_error.html', R_message=R_message)
    if G_userpass is None:
        R_message = "密码为空，请重新注册"
        return render_template('register_error.html', R_message=R_message)
    if G_userpass_2 != G_userpass:
        R_message = "两次密码不匹配，请重新注册"
        return render_template('register_error.html', R_message=R_message)
    print(G_username, G_userpass)
    register_user(G_username, G_userpass)
    return render_template('register_success.html', username=G_username, password=G_userpass)


if __name__ == '__main__':

    app.run(debug=True)
