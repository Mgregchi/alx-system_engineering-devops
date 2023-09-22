#!/usr/bin/python3
"""
Start a Flask web application and display...
"""
from flask import Flask
app = Flask(__name__)
app.url_map.strict_slashes = False


@app.route('/')
def hello():
    """Output: Hello HBNB!"""
    return 'Hello HBNB!'


@app.route('/hbnb')
def hbnb():
    """Output: HBNB"""
    return 'HBNB'


@app.route('/c/<text>')
def c(text):
    """Output: C + text and replace all underscore with white space"""
    return 'C {}'.format(text.replace('_', ' '))


@app.route('/python', defaults={'text': 'is cool'})
@app.route('/python/<text>')
def python(text):
    """Output: Python + text variable and replace underscore with space"""
    return 'Python {}'.format(text.replace('_', ' '))

if __name__ == '__main__':
    app.run(host='0.0.0.0')
