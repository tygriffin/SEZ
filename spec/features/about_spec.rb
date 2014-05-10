require 'spec_helper'

feature 'Navigating to About page' do

  before { visit '/about' }

  it "has a top level header" do
    expect(page).to have_selector('h2', :text => "SEZ について")
  end

  it "has a page lead" do
    expect(page).to have_content("SEZはSimple English Zineの略です。私たちは、ネイティブでない英語学習者向けに、記事やブログをシンプルで分かり易い英語で書いています。難しい語彙については、シンプルな定義と和訳を載せています。")
  end

  it "displays information in Japanese" do
    expect(page).to have_content("時おり、よく知らない歴史的または文化的な記述が出てくる記事があるかもしれませんが、カルチャーノートを載せて背景を説明したり、トピックの前後関係を伝えるようにしています。カルチャーノートは日本語で書かれていますので、素早く容易に読むことが出来ます。")
  end

  it "displays information in English" do
    expect(page).to have_content("Sometimes there may be unfamiliar historical or cultural references in an article, so we've also included some Culture Notes to explain background and give context to the topic. Culture Notes are written in Japanese so you can read them quickly and easily.")
  end

end