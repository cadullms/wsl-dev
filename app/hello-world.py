from flask import render_template
from flask import request
from flask import Flask
app = Flask(__name__)

@app.route('/', methods = ['POST','GET'])
def index():
  if request.method == 'POST':
    whom_to_greet = request.form.get('whom_to_greet')
  else:
    whom_to_greet = None
  return render_template('index.html',whom_to_greet=whom_to_greet)

if __name__ == '__main__':
  app.run()