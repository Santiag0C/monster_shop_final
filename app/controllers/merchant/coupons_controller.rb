class Merchant::CouponsController < Merchant::BaseController
  def index
    @merchant = Merchant.find(params[:merchant_id])
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    new_cup = merchant.coupons.create(item_params)
    if new_cup.save
      redirect_to "merchant/coupons/#{merchant.id}"
    else
      flash[:error] = item.errors.full_messages.to_sentence
    end
  end
  def update

  end
  def destroy

  end
  def item_params
    params.permit(:name,:code,:percent_off)
  end
end
