class GroupChatUser < ApplicationRecord
  belongs_to :user
  belongs_to :groupChat
end
