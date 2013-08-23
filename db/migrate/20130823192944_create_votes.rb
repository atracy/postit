class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :vote
      t.integer :user_id
      #this is the same as doing what we do below
      t.references :voteable, polymorphic: true
      t.timestamps
    end
  end
end
