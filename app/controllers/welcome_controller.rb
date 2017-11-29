class WelcomeController < ApplicationController

  def index
    if logged_in?
      @collection = current_user.collections.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
end
