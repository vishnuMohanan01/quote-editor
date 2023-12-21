class QuotesController < ApplicationController
  before_action :set_quote, only: %i[show edit update destroy]

  def index
    @quotes = Quote.all
  end

  def show
    render
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new quote_params

    if @quote.save
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "Quote was succesfully created!" }
        format.turbo_stream
      end

    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    render
  end

  def update
    if @quote.update(quote_params)
      redirect_to quotes_path, notice: "Quote was succesfully updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quote.destroy!

    respond_to do |format|
      format.html { redirect_to quotes_path, notice: "Quote was succesfully destroyed!" }
      format.turbo_stream
    end
  end

  private

    def set_quote
      @quote = Quote.find params[:id]
    end

    def quote_params
      params.require(:quote).permit(:name)
    end
end
