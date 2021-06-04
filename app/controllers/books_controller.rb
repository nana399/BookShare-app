class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    if params[:search] == nil || ''
      @books= Book.all.page(params[:page]).per(5)
    elsif params[:search] == ''
      @books= Book.all.page(params[:page]).per(5)
    else
      @books = Book.where("body LIKE ? ",'%' + params[:search] + '%').page(params[:page]).per(5)
    end

    @rank_books = Book.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
  end

  def new
     @book = Book.new

     if params[:keyword].present?
      require 'net/http'
      url = 'https://www.googleapis.com/books/v1/volumes?q='
      request = url + params[:keyword]
      enc_str = URI.encode(request)
      uri = URI.parse(enc_str)
      json = Net::HTTP.get(uri)
      @bookjson = JSON.parse(json)

      count = 5 #検索結果に表示する数
      @books = Array.new(count).map{Array.new(4)}
      count.times do |x|
        @books[x][0] = @bookjson.dig("items", x, "volumeInfo", "title")
        @books[x][1] = @bookjson.dig("items", x, "volumeInfo", "imageLinks", "thumbnail")
        @books[x][2] = @bookjson.dig("items", x, "volumeInfo", "authors")
        @books[x][2] = @books[x][2].join(',') if @books[x][2] #複数著者をカンマで区切る
        @books[x][3] = @bookjson.dig("items", x, "volumeInfo", "industryIdentifiers", 0, "identifier")
      end
    end
    @title = params[:title] if params[:title].present?
    @author = params[:author] if params[:author].present?
    @img = params[:image] if params[:image].present?
  end


  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
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
  
end

