class BooksController < ApplicationController
  
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])  #Find busca por un id
    #if @book == nil
    #  redirect_to books_path   #Lo que hace es redirige en caso no haya valor de book
  end

  def new
    @book = Book.new
    @authors = []
    Author.all.map { |author| @authors.append([author.nombre, author.id]) }
  end

  def create
    @book = Book.create(book_params)
    if @book.save 
      redirect_to(books_path)
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
    
    @authors = []  
    Author.all.map { |author| @authors.append([author.nombre, author.id]) } 
    #Internamente se recorre todos los autores y crea un array que contenga el nombre y id de cada autor
  
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      redirect_to(book_path(@book))
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
end