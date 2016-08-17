class CreateNoticeComments < ActiveRecord::Migration
  def change
    create_table :notice_comments do |t|
      
      t.string :content
      #notice_id 는 반드시 지켜야 하는 양식이야. notice의 id일거거든. 1:n의 관계는 이걸 꼭 지켜줘.
      t.integer :notice_id

      t.timestamps null: false
    end
  end
end
