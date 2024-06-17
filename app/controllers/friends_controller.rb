class FriendsController < ApplicationController
    def index
      @friends = Friend.all
    end
  
    def show
      @friend = Friend.find(params[:id])
    end
  
    def new
        @friend = Friend.new
        @friend.gifts.build
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
  
    def friend_params
        params.require(:friend).permit(:name, :birthday, gifts_attributes: [:id, :description, :price, :link, :_destroy])
    end

    def gift_fields
        @gift = Gift.new
        form_builder = view_context.fields_for(:gifts, @gift, child_index: 'NEW_RECORD') do |gf|
          render_to_string(partial: 'gift_fields', locals: { f: gf })
        end
        render html: form_builder
    end
    
    private
    def form_builder_for_partial(name, object)
        ActionView::Helpers::FormBuilder.new(name, object, self, {})
    end
end

