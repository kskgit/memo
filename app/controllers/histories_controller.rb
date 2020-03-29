class HistoriesController < ApplicationController
  before_action :set_history, only: [:update, :destroy]
  # GET /histories/1
  def show
    result = []
    histories = History.where(book_id: params[:id]).order(page_number: "DESC")
    if histories.present?
      histories.each do |history|
        obj = {}
        obj[:'日付'] = history.date
        obj[:'メモ'] = history.memo
        obj[:'ページ'] = history.page_number
        result.push(obj)
      end
    else
      obj = {}
      obj[:'日付'] = ''
      obj[:'メモ'] = ''
      obj[:'ページ'] = ''
      result.push(obj)
    end
    render json: result
  end

  # POST /histories
  def create
    @history = History.new(history_params)

    if @history.save
      render json: @history, status: :created, location: @history
    else
      render json: @history.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /histories/1
  def update
    if @history.update(history_params)
      render json: @history
    else
      render json: @history.errors, status: :unprocessable_entity
    end
  end

  # DELETE /histories/1
  def destroy
    @history.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history
      p params[:id]
      @history = History.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def history_params
      params.fetch(:history_form, {}).permit(
        :book_id,
        :page_number,
        :memo,
        :date
      )
    end
end
