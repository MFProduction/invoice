class PagesController < ApplicationController
def index
  redirect_to organizations_path if user_signed_in?
end

end
