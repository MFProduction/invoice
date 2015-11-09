class PagesController < ApplicationController
def index
  authorize! :read, @page
  #redirect_to organizations_path if user_signed_in?
end

end
