class Chat < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :sender,class_name: "User",foreign_key: 'sender_id'
  belongs_to :recipient, class_name: "User", foreign_key: 'recipient_id'
end
