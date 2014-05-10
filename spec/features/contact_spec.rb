require 'spec_helper'

feature 'Navigating to Contact page' do

  before { visit '/contact' }

  it "has a page header" do
    expect(page).to have_selector('h2', :text => "お問合せ")
  end

  it "has a page lead" do
    expect(page).to have_content("質問、批評、記事のアイディア、ご意見などご自由にお送りください！")
  end

  context "sending a message" do

    before do
      fill_in "contact[name]",    :with => "Yuri Kochiyama"
      fill_in "contact[email]",   :with => "test@example.com"
      fill_in "contact[subject]", :with => "This is a test"
      fill_in "contact[body]",    :with => "This is only a test"
      click_button "送信"
    end

    it "displays a confirmation message" do
      expect(page).to have_content("Thank you very much!")
    end

    it "sends an email" do
      ActionMailer::Base.deliveries.last.to == ["test@example.com"]
    end

  end

end