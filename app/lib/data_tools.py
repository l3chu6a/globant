import csv
from db_tools import save_to_database

ALLOWED_EXTENSIONS = {'csv'}
# Valid file Patterns including Metadata to upload into Database
VALID_FILENAMES = {'departments.csv':       {'table': 'departments', 'pk': 'id', 'columns': ('id', 'department')}, 
                   'hired_employees.csv':   {'table': 'hired_employees', 'pk': 'id', 'columns': ('id', 'name', 'datetime', 'job_id')}, 
                   'jobs.csv':              {'table': 'jobs', 'pk': 'id', 'columns': ('id', 'job')}}

def allowed_file(filename):
    contains_valid_extension = '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS
    is_valid_file = filename in VALID_FILENAMES.keys()

    return contains_valid_extension and is_valid_file

def process_csv(file_path, filename):
    metadata = VALID_FILENAMES[filename]
    with open(file_path, 'r') as csvfile:
        csv_reader = csv.DictReader(csvfile)
        for row in csv_reader:
            save_to_database(row, metadata)