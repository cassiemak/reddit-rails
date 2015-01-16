class AddAvatorPictureToUsers < ActiveRecord::Migration
  def self.up
    # add_column :users, :avatar, :attachement 
    # add_column :table_name, :column_name, :data_type 
    change_table :users do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :users, :avatar
  end
end
