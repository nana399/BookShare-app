class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    if params[:search] == nil || ''
      @books= Book.all
    elsif params[:search] == ''
      @books= Book.all
    else
      @books = Book.where("body LIKE ? ",'%' + params[:search] + '%')
    end
    @rank_books = Book.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
  end



  def new
     @book = Book.new
  end


  def create
    book = Book.new(book_params)
    if book.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to :action => "show", :id => book.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to action: :index
  end

  private
  def book_params
    params.require(:book).permit(:title, :learn, :about, :category, :overrall)
  end

  def google_search
    @res = GoogleBookSearch.instance.search(params[:keyword])
  end
  
end

