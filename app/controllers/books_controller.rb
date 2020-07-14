class BooksController < ApplicationController
  require 'open-uri'
  before_action :set_book, only: [:show, :update, :destroy]

  # GET /books
  def index
    @books = Book.where(is_readed: params[:is_readed])

    render json: @books
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @book = Book.new(book_params)
    # Rakuten Book API経由での画像を保存する場合
    if params[:image_url]
      file = open(params[:image_url])

      extname = File.extname(params[:image_url])
      # .jpg?_ex=120x120←この様に拡張子の後に?区切りでサイズの記載があるため切り取り
      question_length = extname.index("?")
      extname.slice!(question_length..extname.length)

      filename = "#{params[:uid]}#{Time.now}"

      @book.image.attach(io: file, filename: filename, content_type: extname)
    end
    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.discard
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(
        :uid,
        :artist_name,
        :title,
        :is_readed,
        :image
      )
    end
end
