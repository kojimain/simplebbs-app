class CreateBbsPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :bbs_posts do |t|
      t.belongs_to :bbs_thread
      t.text :body
      t.string :poster_name

      t.timestamps
    end
  end
end
