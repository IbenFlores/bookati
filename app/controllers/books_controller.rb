class BooksController < ApplicationController
  def index
    @books = policy_scope(Book)
  end

  def new
    @book = Book.new
    authorize @book
    @seller = current_user.seller
  end

  def create
    @book = Book.new(book_params)
    authorize @book
    @book.seller = current_user.seller
    if @book.save
      redirect_to books_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to profile_path
    else
      render "users/profile", status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    authorize @book
    @book.destroy
    redirect_to profile_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :author, :price)
  end
end
