from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

@app.get("/")
def inicio():
    return {"Mensaje": "Hola Mundo con FastAPI"}

@app.get("/saludo")
def saludo():
    return {"Mensaje": "Hola estudiantes"}

@app.get("/curso")
def curso():
    return {"Nombre": "POO", "Lenguaje": "Python"}

@app.get("/cursos")
def cursos():
    return [{"Nombre": "POO","Lenguaje": "Python"},{"Nombre":".Net","Lenguaje": "C#"}]

class Estudiante(BaseModel):
    nombre: str
    edad: int
    programa: str

@app.post("/estudiante")
def crear_estudiante(estudiante: Estudiante):
    return {"Mensaje": f"Estudiante {estudiante.nombre} creado exitosamente", "Estudiante": estudiante}