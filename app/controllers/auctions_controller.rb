class AuctionsController < ApplicationController

  def index
    @auctions = Auction.all
    render json: @auctions
  end

  def show
    @auction = Auction.find(params[:id])
    render json: @auction
  end

  def create
    
  end

  def update
    
  end

  def destroy
    
  end

  private

  def auction_params
    params.require(:auction).permit(:user_id, :title, :description, :start_date, :end_date)
  end
end
