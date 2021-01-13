class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, uniqueness: true, presence: true
  has_many :chats, foreign_key: :sender_id
  has_many :room_messages
  has_many :messages
  has_many :group_chat_users, dependent: :destroy
  has_many :group_chats,through: :group_chat_users
  has_many :group_messages,dependent: :destroy
  def gravatar_url
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "https://gravatar.com/avatar/#{gravatar_id}.png"
  end
end
