require 'rails_helper'

describe '1.マスタ登録のテスト' do
  let!(:admin) { create(:admin) }
  
  before do
    visit new_admin_session_path
    fill_in 'admin[email]', with: admin.email
    fill_in 'admin[password]', with: admin.password
    click_button 'ログイン'
  end
  
  context '管理者ログインのテスト' do
    it 'ログイン後、管理者トップ（注文履歴一覧）が表示される' do
      expect(current_path).to eq admin_orders_path
    end
  end
end