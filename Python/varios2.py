from faker import Faker

fake = Faker()

class Usurio:
    def __init__(self, nombre, email, telefono, dirrecion):
        self.nombre = nombre
        self.email = email
        self.telefono = telefono    
        self.dirrecion = dirrecion

    def __str__(self):
        return f'Nombre: {self.nombre}, Email: {self.email}, Telefono: {self.telefono}, Dirrecion: {self.dirrecion}'

for i in range(1,10):
    usuario = Usurio(fake.name(), fake.email(), fake.phone_number(), fake.address())

print(usuario)



