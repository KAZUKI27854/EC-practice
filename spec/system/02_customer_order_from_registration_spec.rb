require 'rails_helper'

describe '登録〜注文のテスト' do

  context 'トップページのテスト' do
    let!(:customer) { create(:customer) }

    it '新規登録画面へのリンクを押下すると新規登録画面が表示される' do
      visit root_path
      click_on '新規登録'
      expect(current_path).to eq new_customer_registration_path
    end
  end
  
  describe 'トップページ以降のテスト' do
    before do
      visit new_customer_registration_path
      fill_in 'customer[last_name]', with: "流美衣"
      fill_in 'customer[first_name]', with: "恩零留頭"
      fill_in 'customer[last_name_kana]', with: "ルビー"
      fill_in 'customer[first_name_kana]', with: "オンレイルズ"
      fill_in 'customer[email]', with: "ruby@onrail.com"
      fill_in 'customer[postcode]', with: "ruby_on_rails"
      fill_in 'customer[address]', with: "123456789"
      fill_in 'customer[phone_number]', with: "2222222222"
      fill_in 'customer[password]', with: "testtest"
      fill_in 'customer[password_confirmation]', with: "testtest"
      find(".sign-up-btn").click
    end

    context '新規登録画面のテスト' do
      it '必要事項を入力して登録ボタンを押下するとマイページに遷移する' do
        expect(current_path).to eq customer_path(1)
      end

      it '新規登録画面で入力した情報が表示されている' do
        expect(page).to have_content '流美衣'
        expect(page).to have_content '恩零留頭'
        expect(page).to have_content 'ルビー'
        expect(page).to have_content 'オンレイルズ'
        expect(page).to have_content 'ruby@onrail.com'
        expect(page).to have_content 'ruby_on_rails'
        expect(page).to have_content '123456789'
        expect(page).to have_content '2222222222'
      end
      
      it 'ヘッダーがログイン後の表示に変わっている' do
        expect(page).to have_link 'マイページ'
        expect(page).to have_link '商品一覧'
        expect(page).to have_link 'カート'
        expect(page).to have_link 'ログアウト'
      end
    end
    
    context 'ヘッダーロゴのテスト' do
     it 'ヘッダーロゴを押下してトップ画面に遷移することができる' do
        click_on 'NaganoCAKE'
        expect(current_path).to eq root_path
      end
    end
    
    context 'トップ画面のテスト' do
      let!(:genre) { create(:genre) }
      let!(:item_1) { create(:item) }
      let!(:item_2) { create(:item) }

      it '商品画像を押下して該当商品の詳細画面に遷移する' do
        visit root_path
        find('a[href="/items/1"]').click
        expect(current_path).to eq item_path(1)
      end
      
      it '押下した商品の商品情報が正しく表示されている' do
        visit item_path(1)
        expect(page).to have_content item_1.name
        expect(page).to have_content item_1.caption
        expect(page).to have_content (item_1.price * 1.1).floor
        expect(page).to have_content item_1.genre_id
        expect(item_1.is_active).to be true
      end
    end
    
  end
end