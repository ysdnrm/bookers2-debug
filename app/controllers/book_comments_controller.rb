class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @book.id
    comment.save
    render :book_comments
    # render 'create.js.erb'
    # redirect_back(fallback_location: root_path)
    # redirect_to book_path(book)
  end

  def destroy
    BookComment.find(params[:id]).destroy
    # jsファイルで@bookを書いているから、ここで定義が必要
    @book = Book.find(params[:book_id])
    render :book_comments
    # redirect_back(fallback_location: root_path)
    # redirect_to book_path(params[:book_id])
  end

   private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
