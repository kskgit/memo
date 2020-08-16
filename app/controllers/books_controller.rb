# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[show update destroy]

  # GET /books
  def index
    @books = Book.where(is_readed: params[:is_readed]).where(uid: params[:uid])

    render json: @books, status: :ok
  end

  # POST /books
  def create
    @book = Book.new(book_params)
    attach_book_image(params[:image_url], params[:uid]) if params[:image_url]
    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # POST /books
  def create_by_multipart_form
    Book.create(
      image: params[:image],
      uid: params[:uid],
      author: params[:author],
      title: params[:title]
    )

    render status: :created
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book, status: :ok
    else
      render json: @book.errors
    end
  end

  # DELETE /books/1
  def destroy
    if @book.discard
      render status: :no_content
    else
      render json: @book.errors
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def book_params
    params.permit(
      :uid,
      :author,
      :title,
      :is_readed,
      :page_number
    )
  end

  def attach_book_image(url, uid)
    file = URI.parse(url).open
    extname = File.extname(url)
    # .jpg?_ex=120x120←この様に拡張子の後に?区切りでサイズの記載があるため切り取り
    question_length = extname.index('?')
    extname.slice!(question_length..extname.length)

    filename = "#{uid}#{Time.now}"
    @book.image.attach(
      io: file,
      filename: filename,
      content_type: extname
    )
  end

end
