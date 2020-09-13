class AuthorsController < ApplicationController
  def index
    @authors = Author.all

    if params[:nombre] || params[:apellido]
      nombre = params[:nombre]
      apellido = params[:apellido]
      @authors = Author.where(["nombre LIKE ? AND apellido LIKE?", "%#{nombre}%","%#{apellido}%"])
    else
      @authors = Author.all
    end
    
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  
  def update
    @author = Author.find(params[:id])
    if @author.update_attributes(author_params)
      redirect_to(author_path(@author))
    else
       render('edit')
    end
  end

  
  def create
    @author = Author.create(author_params)
    if @author.save 
      redirect_to(authors_path)
    else
      render 'new'
    end
  end


  def edit
    @author = Author.find(params[:id])
    
  end

  def delete
  end


  private 

  def author_params
    params.require(:author).permit(:nombre, :apellido, :correo, :avatar)
  end

end
