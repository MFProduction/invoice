require 'rails_helper'

describe OrganizationController do
  it do
    params = {
      organization: {
        name: 'Zavod',
        schema_name: 'zavod'
      }
    }
    should permit(:name, :schema_name).
      for(:create, params: params).
      on(:organization)
  end

  describe "GET index" do
    
  end
end