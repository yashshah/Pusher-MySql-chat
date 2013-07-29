class AddContentToChat < ActiveRecord::Migration
  def change
  	create_table :chats do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
