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
  end
end