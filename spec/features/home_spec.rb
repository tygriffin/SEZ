require 'spec_helper'

feature 'Navigating home' do
  let!(:dog_article) { create(:dog_article) }
  let!(:cat_article) { create(:cat_article) }
  let!(:culture_note) { create(:culture_note, :article => dog_article) }

  before { visit '/' }

  it "has a top level header" do
    expect(page).to have_selector("h1", :text => "SEZ")
  end

  it "has a top nav" do
    within "#main_header" do
      expect(page).to have_content("SEZとは", "Contribute")
    end
  end

  it "has a top level lead" do
    within ".sub_header_lead" do
      expect(page).to have_content("優しい英語で書いたウェブマガジン。単語の意味も辞書要らずのポップアップで簡単チェック。ボキャブラリーがどんどん増えます！")
    end
  end

  it "displays two articles" do
    within "#latest_articles" do
      expect(page).to have_css("li.article", :count => 2)
    end
  end

  it "displays details about the articles" do
    within "#latest_articles" do
      expect(page).to have_selector("h2", :text => "Entertainment Dogs!")
      expect(page).to have_content("This article is all about dogs.")
      expect(page).to have_selector("h2", :text => "Entertainment Cats!")
      expect(page).to have_content("This article is all about cats.")
    end
  end

  it "displays study tools for respective articles" do
    within "#latest_articles" do
      expect(page).to have_css(".includes_tool", :text => "文化説明")
    end
  end

  it "has a footer" do
    within "#main_footer" do
      within "#topics" do
        expect(page).to have_content("Entertainment")
      end
      within "#about" do
        expect(page).to have_content("ホーム", "SEZとは", "Contribute", "お問合せ")
      end
      within "#social_media" do
        expect(page).to have_selector("li", :count => 3)
      end
      within "#license" do
        expect(page).to have_content("This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License")
      end
    end
  end

end