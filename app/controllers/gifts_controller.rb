class GiftsController < ApplicationController
    before_action :set_friend
  
    def new
      @gift = @friend.gifts.build
    end
  
    def create
      @gift = @friend.gifts.build(gift_params)
      if @gift.save
        redirect_to @friend, notice: 'Gift was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      @gift = @friend.gifts.find(params[:id])
    end
  
    def update
      @gift = @friend.gifts.find(params[:id])
      if @gift.update(gift_params)
        redirect_to @friend, notice: 'Gift was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @gift = @friend.gifts.find(params[:id])
      @gift.destroy
      redirect_to @friend, notice: 'Gift was successfully destroyed.'
    end
  
    private
  
    def set_friend
      @friend = Friend.find(params[:friend_id])
    end
  
    def gift_params
      params.require(:gift).permit(:description, :price, :link)
    end
end