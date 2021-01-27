from flask import Flask,request,jsonify
import psycopg2
from psycopg2.extras import RealDictCursor
from flask_cors import CORS 

app = Flask(__name__)
CORS(app)

def conexion():
    return psycopg2.connect(
        host="localhost",
        database="gym",
        user="postgres",
        password="Lagox69"
    )
    
@app.route('/')
def principal():
    return '<h1>Bienvenidos a la api GYM </h1>'
   
@app.route('/clientes',methods=['GET'])
def index():
    conn = conexion()
    cur = conn.cursor(cursor_factory=RealDictCursor)
    cur.execute("SELECT * FROM cliente")
    rows = cur.fetchall()
    conn.close()
    cur.close()
    return jsonify(rows)

@app.route('/suscripciones',methods=['GET'])
def suscripciones():
    conn = conexion()
    cur = conn.cursor(cursor_factory=RealDictCursor)
    cur.execute("SELECT * FROM tipo_suscripcion")
    rows = cur.fetchall()
    conn.close()
    cur.close()
    return jsonify(rows)

@app.route('/pases',methods=['GET'])
def pases():
    conn = conexion()
    cur = conn.cursor(cursor_factory=RealDictCursor)
    cur.execute("SELECT * FROM pase_diario")
    rows = cur.fetchall()
    conn.close()
    cur.close()
    return jsonify(rows)

@app.route('/productos',methods=['GET'])
def productos():
    conn = conexion()
    cur = conn.cursor(cursor_factory=RealDictCursor)
    cur.execute("SELECT * FROM producto")
    rows = cur.fetchall()
    conn.close()
    cur.close()
    return jsonify(rows)

@app.route('/procesar',methods=['POST'])
def procesar():
    if request.method == 'POST':
      data = request.form.get
      print(data)
      

    
if __name__ == '__main__':
    app.run(host='127.0.0.1',port=5000,debug=True)

