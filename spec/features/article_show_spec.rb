require 'spec_helper'

feature 'Navigating to an article' do
  let!(:dog_article) { create(:dog_article) }

  before { visit '/article/dogs' }

  it "has a navigation header" do
    within "#article_top_nav" do
      expect(page).to have_selector('h1', :text => "SEZ")
      expect(page).to have_css('a#help', :text => "?")
    end
  end

  it "displays a help modal"

  it "displays a top level image" do
    within "#article_top" do
      expect(page).to have_css("img[src*='test_image.jpg']")
    end
  end

end