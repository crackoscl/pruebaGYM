@app.route('/profile1', methods=['GET','POST'])
@nocache
def profile1():
failed_responses_keys_back =""
message=""
source = "profile1" #route to be passed to success screen
left_bar_names = LEFT_BAR_NAMES_PROFILE
left_bar_targets = LEFT_BAR_TARGETS_PROFILE
#initializes responses from devices to 0
initialize_responses(app_path, devices_list)
if not session.get('logged_in'):
abort(401)
if request.method == 'POST':
request_string = request.form['boton']
current_user_id = mysql_tools.query_db('localhost', DB_USER, DB_PASS, DB_NAME,
'select user_id from users where username=%s;', (session['user'],))[0][0]
print( current_user_id)
if request_string == 'Actualizar':
name = (request.form.get("name"))
lastname = (request.form.get("lastname"))
run = (request.form.get("run"))
password = (request.form.get("password"))
work_id = (request.form.get("work_id"))
em