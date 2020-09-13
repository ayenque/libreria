# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Author.create(nombre: 'Angelo', apellido: 'Yenque', correo: 'correo@ayenque.page')
Author.create(nombre: 'Paul', apellido: 'Gutierrez', correo: 'hola@ayenque.page')
Author.create(nombre: 'Tume', apellido: 'Salas', correo: 'admin@ayenque.page')

Book.create(titulo: 'Libro 1', author_id: 1 , descripcion: 'Desc Libro 1' , estado: 'Publicado', visible:false)
Book.create(titulo: 'Libro 2', author_id: 2 , descripcion: 'Desc Libro 2' , estado: 'Publicado', visible:false)
Book.create(titulo: 'Libro 3', author_id: 3 , descripcion: 'Desc Libro 3' , estado: 'Publicado', visible:false)