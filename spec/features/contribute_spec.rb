require 'spec_helper'

feature 'Navigating to Contribute page' do

  before { visit '/contribute' }

  it "has a top level header" do
    expect(page).to have_selector('h2', :text => "Contribute")
  end

  it "has a page lead" do
    expect(page).to have_content("We make this thing because we like making it, and we hope you like reading it. If you'd like to help us continue this project there are many ways you can contribute. We greatly appreciate any kind of support you give. Your support is the only reason we can continue making this magazine.")
  end

  it "displays information in English" do
    expect(page).to have_content("We accept manuscripts on a variety of topics, but all writing should be written in simplified English. If you're not sure what that means, feel free to send us something written in your usual style and we may be able to help you simplify it.")
  end

end