require 'spec_helper'

feature 'Navigating to an article' do
  let!(:dog_article)     { create(:dog_article) }
  let!(:cat_article)     { create(:cat_article, :pubdate => Time.zone.today - 1.year) }
  let!(:vocabulary_word) { create(:vocabulary_word, :article => dog_article) }
  let!(:tag)             { create(:tag, :article => dog_article) }

  before { visit '/article/dogs' }

  it "has a navigation header" do
    within ".top-nav" do
      expect(page).to have_selector('h1', :text => "SEZ")
      expect(page).to have_css('#help', :text => "?")
    end
  end

  it "displays a help modal" do
    click_link "help"
    expect(page).to have_content("SEZの使い方")
  end

  it "displays a top level image" do
    within ".article-top" do
      expect(page).to have_css("img[src*='test_image.jpg']")
    end
  end

  it "displays the article title" do
    within ".article-top" do
      expect(page).to have_selector('h2', :text => "Dogs!")
    end
  end

  it "displays article meta info" do
    within ".intro" do
      expect(page).to have_content("Entertainment")
      expect(page).to have_content(Time.zone.today.strftime("%Y年%m月%d日 掲載　James Baldwin 著"))
      expect(page).to have_content("This article is all about dogs.")
      expect(page).to have_content("単語付き")
    end
  end

  it "displays the article content" do
    within ".article-body" do
      expect(page).to have_content("I am the very model of a major modern general.")
    end
  end

  it "displays a link to the previous article" do
    within ".next-reads" do
      expect(page).to have_content("前の記事：　Cats!")
    end
  end

  it "displays vocabulary" do
    within ".vocab" do
      expect(page).to have_content("general")
      expect(page).to have_content("relating to the main or major parts of something rather than the details")
      expect(page).to have_content("一般的")
      expect(page).to have_content("adjective")
    end
  end

  it "displays tags" do
    within ".tags" do
      expect(page).to have_content("k-9")
    end
  end

end