require 'rails_helper'

describe '1.マスタ登録のテスト' do
  let!(:admin) { create(:admin) }
  let!(:customer) { create(:customer) }
  let!(:genre) { create(:genre) }
  let!(:item) { create(:item) }
  let!(:order) { create(:order) }
  let!(:order_item) { create(:order_item) }
  let!(:item_2) { create(:item) }

  before do
    visit new_admin_session_path
    fill_in 'admin[email]', with: admin.email
    fill_in 'admin[password]', with: admin.password
    click_button 'ログイン'
  end
  
  it 'ログイン後、管理者トップ（注文履歴一覧）が表示される' do
    expect(current_path).to eq admin_orders_path
  end
  
  it 'ログイン後、ヘッダーに注文履歴一覧のリンクが存在する' do
    expect(page).to have_link '注文履歴一覧'
  end
end