require 'rails_helper'
describe 'Routing', type: :routing do
  describe 'Analytic resources' do
    it do
      should route(:get, '/analytics').
        to(controller: :analytics, action: :index)
    end
    it do
      should route(:get, '/analytics/new').
        to(controller: :analytics, action: :new)
    
    end
    it do
      should route(:post, '/analytics').
      to('analytics#create')
    end

    it "should route edit and update"
    # it do
    #   should route(:get, '/analytics/1/edit').
    #   to(controller: :analytics, action: :edit, id: 1)
    # end
    # it do
    #   should route(:put, '/analytics/1').
    #   to(controller: :analytics, action: :update, id: 1)
    # end
    # it do
    #   should route(:patch, '/analytics/1').
    #   to(controller: :analytics, action: :update, id: 1)
    # end

    it do
        should route(:delete, '/analytics/1').
        to(controller: :analytics, action: :destroy, id: 1)
    end
  end
end
