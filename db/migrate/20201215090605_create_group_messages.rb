class CreateGroupMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :group_messages do |t|
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.references :groupChat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
