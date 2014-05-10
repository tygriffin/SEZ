require 'spec_helper'

feature 'Navigating home' do
  let!(:dog_article) { create(:dog_article) }
  let!(:cat_article) { create(:cat_article) }

  before { visit '/' }

  it "has a top level header" do
    expect(page).to have_selector("h1", :text => "SEZ")
  end

  it "has a top nav" do
    within "#main_header" do
      expect(page).to have_content("SEZとは", "Contribute")
    end
  end

  it "displays two articles" do
    within "#latest_articles" do
      expect(page).to have_css("li.article", :count => 2)
    end
  end

  it "displays details about the articles"

end