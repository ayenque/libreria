class BooksController < ApplicationController


  before_action :find_author
  #, :only => [:index, :show]
  #, :except => [:new]

  def index

    #@author = Author.find(params[:author_id])
    @books = @author.books  #esto lo lee ya que en el modelo existe la relación
    #Obtener el id del author en los parametros
    #obtener el author con el id recibido
    #buscar los libros del autor
  end

  def show
    #@author = Author.find(params[:author_id])
    @book = Book.find(params[:id])  #Find busca por un id
    #if @book == nil
    #  redirect_to books_path   #Lo que hace es redirige en caso no haya valor de book
  end

  def new
    #@author = Author.find(params[:author_id])
    @book = Book.new(:author_id => @author.id)
    #@authors = []
    #Author.all.map { |author| @authors.append([author.nombre, author.id]) }
  end

  def create
    #@author = Author.find(params[:author_id])
    @book = Book.create(book_params)
    @book.author = @author
    if @book.save 
      redirect_to(books_path(:author_id => @author.id))
    else
      render 'new'
    end
  end

  def edit
    #@author = Author.find(params[:author_id])
    @book = Book.find(params[:id])
    #@authors = []  
    #Author.all.map { |author| @authors.append([author.nombre, author.id]) } 
    #Internamente se recorre todos los autores y crea un array que contenga el nombre y id de cada autor
  
  end

  def update
    #@author = Author.find(params[:author_id])
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      redirect_to(book_path(@book, :author_id => @author.id))
    else
      @authors = []  #se vuelve a generar el array de author, si no se hace lo va a buscar 
      # y se mostrará un error
      Author.all.map { |author| @authors.append([author.nombre, author.id]) } 
      #map recorre todos los autores y crea el arreglo
      render('edit')
    end
  end

  def delete
  end

  private 

  def book_params
    params.require(:book).permit(:titulo, :author_id, :visible, :descripcion, :estado)
  end

  def find_author
    @author = Author.find(params[:author_id])
  end
end