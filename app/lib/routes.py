from flask import Blueprint,request, jsonify
from data_tools import allowed_file, process_csv
from os.path import join

UPLOAD_FOLDER = 'uploads'

app_bp = Blueprint('main', __name__)

@app_bp.route('/upload', methods=['POST'])
def upload_file():
    # Check if file is included in POST method
    if 'file' not in request.files:
        print(request.files)
        return jsonify({'error': 'No file provided'}), 400

    file = request.files['file']
    filename = file.filename

    # Check if filename is not blank.
    if filename == '':
        return jsonify({'error': 'No selected file'}), 400

    if file and allowed_file(filename):
        # Save file in UPLOAD_FOLDER
        file_path = join(UPLOAD_FOLDER, filename)
        file.save(file_path)

        # Process csv and catch exceptions.
        try:
            process_csv(file_path, filename)
            return jsonify({'success': 'File uploaded and data loaded successfully'}), 200
        except Exception as e:
            return jsonify({'error': f'Error processing CSV file: {str(e)}'}), 500

    else:
        return jsonify({'error': 'Invalid file format'}), 400