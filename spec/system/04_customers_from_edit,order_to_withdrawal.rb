require 'rails_helper'

describe '4.顧客登録情報変更〜退会のテスト' do
  let!(:customer) { create(:customer) }

  before do
    visit new_customer_session_path
    fill_in 'customer[email]', with: customer.email
    fill_in 'customer[password]', with: customer.password
    click_button 'ログイン'
  end
  
  describe '登録情報変更〜配送先一覧画面のテスト' do
    context 'マイページのテスト' do
      it '「編集する」を押すと会員情報編集画面に遷移する' do
        visit customer_path(customer)
        click_link '編集する'
        expect(current_path).to eq edit_customer_path(customer)
      end
    end
    
    context '会員情報編集画面とマイページのテスト' do
      before do
        visit edit_customer_path(customer)
        fill_in 'customer[last_name]', with: '山田'
        fill_in 'customer[first_name]', with: '太郎'
        fill_in 'customer[last_name_kana]', with: 'ヤマダ'
        fill_in 'customer[first_name_kana]', with: 'タロウ'
        fill_in 'customer[postcode]', with: '1234567'
        fill_in 'customer[address]', with: '京都府京都市金閣寺町1234'
        fill_in 'customer[phone_number]', with: '09012345678'
        fill_in 'customer[email]', with: 'yamada@tarou.com'
        click_button '編集内容を保存'
      end

      it '全項目を編集し「編集内容を保存」を押すとマイページに遷移する' do
        expect(current_path).to eq customer_path(customer)
      end
      
      it 'マイページに変更した内容が表示されている' do
        expect(page).to have_content '山田'
        expect(page).to have_content '太郎'
        expect(page).to have_content 'ヤマダ'
        expect(page).to have_content 'タロウ'
        expect(page).to have_content '1234567'
        expect(page).to have_content '京都府京都市金閣寺町1234'
        expect(page).to have_content '09012345678'
        expect(page).to have_content 'yamada@tarou.com'
      end
      
      it 'マイページで配送先の「一覧を表示する」ボタンを押すと配送先一覧画面に遷移する' do
        find('a[href="/deliveries"]').click
        expect(current_path).to eq deliveries_path
      end
    end
  end
end