require 'rails_helper'
describe 'Routing', type: :routing do
  describe 'Pages routes' do
    it do
      should route(:get, '/').
        to(controller: :pages, action: :index)
    end
  end
end
