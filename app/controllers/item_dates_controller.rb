class ItemDatesController < ApplicationController
  before_action :set_quote, only: %i[new create]

  def new
    @item_date = @quote.item_dates.build
  end

  def create
    item_date = @quote.item_dates.build(item_date_params)

    if item_date.save
      redirect_to @quote, notice: "Date was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_date_params
    params.require(:item_date).permit(:date)
  end

  def set_quote
    @quote = current_company.quotes.find(params[:quote_id])
  end
end
