class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|

      t.string :user
      t.integer :numVotes

      t.timestamps
    end
  end
end
