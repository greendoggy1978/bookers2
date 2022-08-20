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

   @book_image = 削除するBookImageレコードを取得
   @book_image.削除
    redirect_to BookImageの一覧ページへのパス
 end

 def edit
   @book = Book.find(params[:id])
 end

 def update
   @book = Book.find(params[:id])
   @book.update(book_params)
   redirect_to book_path(@book.id)
 end

 def new
   @book= Book.new
 end


def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    book.save
    # 4. トップ画面へリダイレクト
    redirect_to '/top'
end

 private

 def book_params
   params.require(:book).permit(:title, :body)
 end

end