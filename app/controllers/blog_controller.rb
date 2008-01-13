class BlogController < ApplicationController
  def index
    # show first post
    render :action => :post
  end

  def post
    # show specific post
  end
end
