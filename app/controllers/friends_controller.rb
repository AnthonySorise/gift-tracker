class FriendsController < ApplicationController
    def index
      @friends = Friend.all
    end
  
    def show
      @friend = Friend.find(params[:id])
    end
  
    def new
      @friend = Friend.new
    end
  
    def edit
      @friend = Friend.find(params[:id])
    end
  
    def create
      @friend = Friend.new(friend_params)
      if @friend.save
        redirect_to @friend, notice: 'Friend was successfully created.'
      else
        render :new
      end
    end
  
    def update
      @friend = Friend.find(params[:id])
      if @friend.update(friend_params)
        redirect_to @friend, notice: 'Friend was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @friend = Friend.find(params[:id])
      @friend.destroy
      redirect_to friends_url, notice: 'Friend was successfully destroyed.'
    end
  
    private
  
    def friend_params
      params.require(:friend).permit(:name, :birthday)
    end
end