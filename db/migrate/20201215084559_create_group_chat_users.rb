class CreateGroupChatUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :group_chat_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :groupChat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
