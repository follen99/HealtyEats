from flask import Flask, render_template, request, redirect, url_for, flash, jsonify
import sqlite3

app = Flask(__name__)  

@app.route('/')
def index():
    return render_template('index.html')