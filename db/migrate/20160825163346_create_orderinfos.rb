class CreateOrderinfos < ActiveRecord::Migration
  def change
    create_table :orderinfos do |t|
      
      #JH - myorder에서 사용하는 db
      t.integer :user_id        #userId
      t.text :product_name      #제품 이름
      t.string :product_price   #제품 가격
      t.string :product_img     #제품 사진
      t.string :product_url     #제품 상세주소

      t.timestamps null: false
    end
  end
end
