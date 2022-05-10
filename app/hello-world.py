from flask import render_template
from flask import request
from flask import Flask
app = Flask(__name__)

@app.route('/', methods = ['POST','GET'])
def index():
  if request.method == 'POST':
    who_are_you = request.form.get('who_are_you')
  else:
    who_are_you = None
  return render_template('index.html',who_are_you=who_are_you)

if __name__ == '__main__':
  app.run()