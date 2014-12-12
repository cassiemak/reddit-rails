class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      # by default, it already has ID
      #t.data_type :column_name
      t.string :title
      t.string :url
      t.integer :user_id
      
      t.timestamps
    end
  end
end
