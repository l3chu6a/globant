from flask import Flask
import os
import sys

# Custom libs
wd = os.getcwd()
conf_location = wd + '/conf'
libs_location = wd + '/lib'

sys.path.insert(0, conf_location)
sys.path.insert(0, libs_location)

from conf import HOST, USER, PWD, DATABASE, PORT, DATABASE
from db_tools import init_mysql
from routes import app_bp

def create_app():
    app = Flask(__name__)

    app.config['MYSQL_DATABASE_HOST'] = HOST
    app.config['MYSQL_DATABASE_USER'] = USER
    app.config['MYSQL_DATABASE_PORT'] = PORT
    app.config['MYSQL_DATABASE_PASSWORD'] = PWD
    app.config['MYSQL_DATABASE_DB'] = DATABASE

    app.register_blueprint(app_bp)

    return app

if __name__ == '__main__':
    app = create_app()
    init_mysql(app)
    app.run(debug=True, host='0.0.0.0', port=5000)