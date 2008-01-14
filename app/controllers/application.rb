# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '1ac55be815a771a2d067f23d90acfa4f'
  
  before_filter :menu
  
  private
    def menu
      @menu = [['/', 'marten veldthuis'],
               ['/posts', 'blog']]
    end
end
