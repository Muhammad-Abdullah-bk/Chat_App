class GroupMessage < ApplicationRecord
  belongs_to :user
  belongs_to :groupChat
end
