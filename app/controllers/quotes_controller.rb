class QuotesController < ApplicationController
  before_action :set_quote, only: %i[show edit]

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
      redirect_to quotes_path, notice: "Quote was succesfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    render
  end

  def update
    @quote.update!(quote_params)

    redirect_to :quotes_path, notice: "Quote was succesfully destroyed!"
  end

  def destroy
    @quote.destroy!

    redirect_to :quotes_path, notice: "Quote was succesfully destroyed!"
  end

  private

    def set_quote
      @quote = Quote.find params[:id]
    end

    def quote_params
      params.require(:quote).permit(:name)
    end
end
