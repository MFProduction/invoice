require 'rails_helper'
describe "manipulate organization", :type => :feature do
  it "add new organization" do
    org = create(:organization, name:"nsov zavod")
    
    visit organizations_path
    expect(page).to have_content("nsov zavod")
  end

  #TODO Tantet subdoma (schema) must be unique
  #user must be loged in
  #only on www.domain
end

