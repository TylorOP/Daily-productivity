from http.client import responses

from flask import Flask, render_template,request, jsonify
from forms.userform import RegistrationForm
from utils import DBCred
import pymysql


app = Flask(__name__)

@app.route('/register', methods=['GET', 'POST'])
def register():
    form = RegistrationForm(request.form)
    if request.method == 'POST' and form.validate():
        print(form.username.data, form.email.data,
                    form.password.data)

    return render_template('register.html', form=form)



data = {
    "id" : 104,
    "name": "shubham",
    "sal": 86493,
    "city": "pune"
}


@app.route('/')
@app.route("/home")
def home():
    return render_template('home.html',data=data)
@app.route('/about')
def about():
    return render_template('about.html')

@app.route('/contact')
def contact():
    return render_template('contact.html')

#crud Operations

conn = pymysql.connect(host=DBCred.host, user= DBCred.user, port=DBCred.port, db= DBCred.dbname, password=DBCred.password)

@app.route("/getitem")
def getdata():
    cur = conn.cursor()
    cur.execute("SELECT * FROM emp")
    data = cur.fetchall()
    cur.close()
    items  = [{'id': item[0], 'name': item[1], 'sal': item[2], 'city': item[3]} for item in data for item in data]

    response = {
        'message' : "Data fetched Successfully",
        'data' : items
    }
    return jsonify(response)


@app.route("/additem", methods=['POST'])
def add_data():
    data = request.get_json()
    id = data['id']
    name = data['name']
    sal = data['sal']
    city = data['city']
    cur = conn.cursor()
    cur.execute('''INSERT INTO emp (id, name, salary, city) VALUES ({}, "{}", {}, "{}")'''.format(id, name, sal, city))
    #cur.execute('''insert into emp values ({},"{}",{},"{}"'''.format(id, name, sal, city))
    conn.commit()
    response = {
        'message' : "Data added Successfully",
        'data' : data
    }
    return jsonify(response)


@app.route("/deleteitem/<int:id>", methods=['DELETE'])
def delete_data(id):
    #id = request.args.get('id')
    cur = conn.cursor()
    cur.execute('delete from emp where id = {}'.format(id))
    conn.commit()
    cur.close()
    response = {'message' : "Data deleted Successfully",
                'data' : {'id' :id}}
    return jsonify(response)


@app.route("/updateitem/<int:id>", methods=['PUT'])
def update_data(id):
    data = request.get_json()
    name = data['name']
    sal = data['sal']
    city = data['city']
    cur = conn.cursor()
    cur.execute("UPDATE emp SET name = '{}', city = '{}', salary = {} WHERE id = {}".format(name, city, sal, id))
    conn.commit()
    cur.close()
    response = {'message' : "Data updated Successfully",
                'data' : {'id' :id}}
    return jsonify(response)

if __name__ == '__main__':
    app.run(debug=True)
