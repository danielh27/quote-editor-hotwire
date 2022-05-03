class ItemDatesController < ApplicationController
  before_action :set_quote
  before_action :set_item_date, only: %i[edit update destroy]

  def new
    @item_date = @quote.item_dates.build
  end

  def create
    @item_date = @quote.item_dates.build(item_date_params)

    if @item_date.save
      redirect_to @quote, notice: "Date was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @item_date.update(item_date_params)
      redirect_to @quote, notice: "Date was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item_date.destroy

    redirect_to @quote, notice: "Date was successfully deleted"
  end

  private

  def item_date_params
    params.require(:item_date).permit(:date)
  end

  def set_quote
    @quote = current_company.quotes.find(params[:quote_id])
  end

  def set_item_date
    @item_date = @quote.item_dates.find(params[:id])
  end
end
