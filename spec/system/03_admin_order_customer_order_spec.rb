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
  