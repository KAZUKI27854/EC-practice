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
  
  it '注文履歴一覧をクリックすると注文一覧ページが表示される' do
    click_link '注文履歴一覧'
    expect(current_path).to eq admin_orders_path
  end
  
  context '注文履歴一覧画面のテスト' do
    before do
      visit admin_orders_path
    end

    it "注文一覧画面の中に注文詳細画面へのリンク先が表示される" do
      expect(page).to have_css '.rspecorder'
    end
  end
  
  context '注文詳細画面のテスト' do
    before do
      visit admin_order_path(order.id)
      OrderItem.create(item_id: 2, order_id: 1, quantity: 1, market_price: item_2.price, product_status: 3)
    end

    it '注文ステータスを入金確認に変更すると制作ステータスが制作待ちに更新される' do
      # expect(page).to have_content '入金待ち'
      select "入金確認", from: 'order[status]'
      find(".order_btn").click
      expect(order_item.reload.product_status).to eq "製作待ち"
    end
    
    it '製作ステータスを１つ製作中に変更する' do
      select "製作中", from: 'order_item[product_status]'
      find('.order_item_btn').click
      expect(order.reload.status).to eq "製作中"
    end
    
    it '全ての商品の製作ステータスを製作完了にしたら注文ステータスが発送待ちに更新されるか' do
      select "製作完了", from: 'order_item[product_status]'
      find('.order_item_btn').click
      expect(order.reload.status).to eq '発送準備中'
    end
  end
end