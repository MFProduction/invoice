require 'rails_helper'
describe 'Routing', type: :routing do
  describe 'Organizations resources' do
    it do
      should route(:get, '/organizations').
        to(controller: :organizations, action: :index)
    end
    it do
      should route(:get, '/organizations/new').
        to(controller: :organizations, action: :new)
    
    end
    it do
      should route(:post, '/organizations').
      to('organizations#create')
    end

    it do
      should route(:get, '/organizations/1/edit').
      to(controller: :organizations, action: :edit, id: 1)
    end
    it do
      should route(:put, '/organizations/1').
      to(controller: :organizations, action: :update, id: 1)
    end
    it do
      should route(:patch, '/organizations/1').
      to(controller: :organizations, action: :update, id: 1)
    end

    it do
        should route(:delete, '/organizations/1').
        to(controller: :organizations, action: :destroy, id: 1)
    end
  end
end
