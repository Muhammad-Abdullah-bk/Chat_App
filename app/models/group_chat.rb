class GroupChat < ApplicationRecord
  has_many :group_chat_users, dependent: :destroy
  has_many :users,through: :group_chat_users
  has_many :group_messages, dependent: :destroy
  validates :name,presence: true
end
