from flask import Flask, render_template, url_for, request, redirect
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
credentials =  {'user':'postgres',
                'password':'12345',
                'host':'localhost',
                'port': '5432',
                'database': 'copy_homework2'}
# app.config['SQLALCHEMY_DATABASE_URI'] = "postgresql://{user}:{password}@{host}:{port}/{database}".format(**credentials)
app.config['SQLALCHEMY_DATABASE_URI'] = "postgres://asewvcjf:3B8jeP-JHvJlu8SCvzYRQoa2oSwXb-oP@john.db.elephantsql.com/asewvcjf"
db = SQLAlchemy(app)

disease_code_dict = {'TUBE':'Tuberculosis', 'COV19':'Covid-19', 'EBOL':'Ebola', 'GONR': 'Gonorrhea', 'DENG': 'Dengue', 'ALZH':'Alzheimers', 'DIPH':'Diphtheria', 'BUBO':'Bubonic', 'MLRA':'Malaria', 'STRK': 'Stroke'}
inv_disease_code_dict = {v: k for k, v in disease_code_dict.items()}

with db.engine.connect() as connection:
    countries = connection.execute("SELECT * FROM country;").fetchall()
    diseases = connection.execute("SELECT * FROM disease;").fetchall()

@app.route("/", methods=['POST', 'GET'])
def index():

    if request.method == 'POST':
        country = request.form['cname'].strip()
        disease = request.form['disease'].strip()
        script = "SELECT * FROM record "
        if country=="" and disease!="":
            script += f"WHERE disease_code='{inv_disease_code_dict[disease]}'"
        elif country!="" and disease=="":
            script += f"WHERE cname='{country}'"
        elif country!="" and disease!="":
            script += f"WHERE cname='{country}' AND disease_code='{inv_disease_code_dict[disease]}'"
        else:
            script += ";"
        with db.engine.connect() as connection:
            result = connection.execute(script).fetchall()
            countries = connection.execute("SELECT * FROM country;").fetchall()
            diseases = connection.execute("SELECT * FROM disease;").fetchall()

        return render_template('index.html', records=result, countries=countries, diseases= diseases, disease_code_dict=disease_code_dict)
    else:
        with db.engine.connect() as connection:
            result = connection.execute("SELECT * FROM record;").fetchall()
            countries = connection.execute("SELECT * FROM country;").fetchall()
            diseases = connection.execute("SELECT * FROM disease;").fetchall()

        return render_template('index.html', records=result, countries=countries, diseases= diseases, disease_code_dict=disease_code_dict)

@app.route("/delete", methods=['POST', 'GET'])
def delete():
    if request.method == 'POST':
        email = request.form['email'].strip()
        password = request.form['password'].strip()
        record_id = request.form['record_id'].strip()
        with db.engine.connect() as connection:
            quered_password = connection.execute(f"SELECT password FROM accounts WHERE email='{email}';").fetchall()
            if not quered_password or quered_password[0][0] != password:
                message = "Wrong email or password. Record is not deleted. Try again!"
                return render_template("wrong_input.html", message=message), {"Refresh": "2; url=/delete"}
            else:

                if not record_id.isnumeric() or not connection.execute(f"SELECT * FROM record WHERE record_id='{record_id}';").fetchall():
                    message = "Wrong Record ID. Try again!"
                    return render_template("wrong_input.html", message=message), {"Refresh": "2; url=/delete"}

                delete_output = connection.execute(f"DELETE FROM record WHERE record_id='{record_id}' RETURNING *;").fetchall()
                
                if delete_output:
                    message = f"Record ID {record_id} successfully deleted!"
                else:
                    message = f"Record ID {record_id} does not exist"
                return render_template("wrong_input.html", message=message), {"Refresh": "2; url=/delete"}
    else:
        return render_template("delete.html")

@app.route("/update", methods=['POST', 'GET'])
def update():
    if request.method == 'POST':
        email = request.form['email'].strip()
        password = request.form['password'].strip()
        record_id = request.form['record_id'].strip()

        country = request.form['cname'].strip()
        disease = request.form['disease'].strip()
        total_deaths = request.form['total_deaths'].strip()
        total_patients = request.form['total_patients'].strip()
        updated_columns = dict()
        with db.engine.connect() as connection:
            quered_password = connection.execute(f"SELECT password FROM accounts WHERE email='{email}';").fetchall()
            
            if not quered_password or quered_password[0][0] != password:
                message = "Wrong email or password. Nothing updated. Try again!"
                return render_template("wrong_input.html", message=message), {"Refresh": "2; url=/update"}
            
            if not record_id.isnumeric() or not connection.execute(f"SELECT * FROM record WHERE record_id='{record_id}';").fetchall():
                message = "Wrong Record ID. Try again!"
                return render_template("wrong_input.html", message=message), {"Refresh": "2; url=/update"}
            
            if country != "":
                if not connection.execute(f"SELECT * FROM country WHERE cname='{country}';").fetchall():
                    message = "Wrong country. Try again!"
                    return render_template("wrong_input.html", message=message), {"Refresh": "2; url=/update"}
                else:
                    updated_columns["country"] = True if connection.execute(f"UPDATE record SET cname='{country}' WHERE record_id={record_id} RETURNING *;").fetchall() else False

            if disease != "":
                if not connection.execute(f"SELECT * FROM disease WHERE disease_code='{inv_disease_code_dict.get(disease)}';").fetchall():
                    message = "Wrong disease name. Try again!"
                    return render_template("wrong_input.html", message=message), {"Refresh": "2; url=/update"}
                else:
                    updated_columns["disease"] = True if connection.execute(f"UPDATE record SET disease_code='{inv_disease_code_dict.get(disease)}' WHERE record_id={record_id} RETURNING *;").fetchall() else False
            
            if total_deaths != "":
                if not total_deaths.isnumeric():
                    message = "Wrong total deaths. Try again!"
                    return render_template("wrong_input.html", message=message), {"Refresh": "2; url=/update"}
                else:
                    updated_columns["total deaths"] = True if connection.execute(f"UPDATE record SET total_deaths={total_deaths} WHERE record_id={record_id} RETURNING *;").fetchall() else False

            if total_patients != "":
                if not total_patients.isnumeric():
                    message = "Wrong total patients. Try again!"
                    return render_template("wrong_input.html", message=message), {"Refresh": "2; url=/update"}
                else:
                    updated_columns["total patients"] = True if connection.execute(f"UPDATE record SET total_patients={total_patients} WHERE record_id={record_id} RETURNING *;").fetchall() else False

            message = ", ".join([k for k, v in updated_columns.items() if v]) + f" successfully updated in record ID {record_id}"

            message = message.capitalize()
            return render_template("wrong_input.html", message=message), {"Refresh": "5; url=/update"}

    else:
        return render_template("update.html", countries=countries, diseases= diseases, disease_code_dict=disease_code_dict)

@app.route("/insert", methods=['POST', 'GET'])
def insert():
    if request.method == 'POST':
        email = request.form['email'].strip()
        password = request.form['password'].strip()

        country = request.form['cname'].strip()
        disease = request.form['disease'].strip()
        total_deaths = request.form['total_deaths'].strip()
        total_patients = request.form['total_patients'].strip()
        with db.engine.connect() as connection:
            quered_password = connection.execute(f"SELECT password FROM accounts WHERE email='{email}';").fetchall()
            
            if not quered_password or quered_password[0][0] != password:
                message = "Wrong email or password. Nothing updated. Try again!"
                return render_template("wrong_input.html", message=message), {"Refresh": "2; url=/insert"}
            
            if country == "" or not connection.execute(f"SELECT * FROM country WHERE cname='{country}';").fetchall():
                message = "Wrong country. Try again!"
                return render_template("wrong_input.html", message=message), {"Refresh": "2; url=/insert"}
            
            if disease == "" or not connection.execute(f"SELECT * FROM disease WHERE disease_code='{inv_disease_code_dict.get(disease)}';").fetchall():
                message = "Wrong disease name. Try again!"
                return render_template("wrong_input.html", message=message), {"Refresh": "2; url=/insert"}
            
            if not total_deaths.isnumeric():
                message = "Wrong total deaths. Try again!"
                return render_template("wrong_input.html", message=message), {"Refresh": "2; url=/insert"}
                
            if not total_patients.isnumeric():
                message = "Wrong total patients. Try again!"
                return render_template("wrong_input.html", message=message), {"Refresh": "2; url=/insert"}
            
            try:
                connection.execute(f"INSERT INTO record(email, cname, disease_code, total_deaths, total_patients) VALUES('{email}', '{country}', '{inv_disease_code_dict.get(disease)}', {total_deaths}, {total_patients});")
            except Exception as e:
                message = "Country and disease combination already exists in the table for your email. If you want to change the row, just update it."
                return render_template("wrong_input.html", message=message), {"Refresh": "2; url=/update"}
            
            message = ", ".join([email, country, disease, total_deaths, total_patients]) + " successfully added to the database!"
            return render_template("wrong_input.html", message=message), {"Refresh": "5; url=/"}
 
    else:
        return render_template('insert.html',countries=countries, diseases= diseases, disease_code_dict=disease_code_dict)

if __name__ == "__main__":
    app.run(debug=True)