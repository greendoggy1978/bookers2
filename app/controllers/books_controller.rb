#仮登録　モデル（Books）が作成できていないため
class BooksController < ApplicationController

 def index
   @book= Book.new
   @books=Book.all
 end

 def show
   @book_new= Book.new
   @book= Book.find(params[:id])

 end

 def destroy
   @book= Book.find(params[:id])
   @book.destroy
   redirect_to books_path
 end

 def edit
   @book = Book.find(params[:id])
   if @book.user.id == current_user.id
      render 'edit'
   else
      redirect_to books_path
   end
 end

 def update
   @book = Book.find(params[:id])
   if @book.update(book_params)
       flash[:update] = "You have updated book successfully."
       redirect_to book_path(@book.id)
   else
       render 'edit'
   end
 end

 def new
   @book= Book.new
 end


 def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
    if @book.save
       flash[:save] = "You have creatad book successfully."
       @books = Book.all
  	   redirect_to book_path(@book)
    else
      @books = Book.all
      render 'index'
    end
 end

 private

 def book_params
   params.require(:book).permit(:title, :body)
 end

end