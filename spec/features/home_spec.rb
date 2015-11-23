require 'rails_helper'

feature "visiting the homepage" do
  scenario "the visitor sees welcome text" do
    visit root_path
    expect(page).to have_text("Welcome to Invoice")
  end
end

describe "visiting the homepage" do
  it "visits the home page" do
    visit root_path
    expect(page).to have_text("Welcome to Invoice")
  end
end