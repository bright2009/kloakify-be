class User < ApplicationRecord
  has_one :subscription
  has_many :sent_documents, class_name: 'SentDocument', foreign_key: 'sender_id'
  has_many :received_documents, class_name: 'ReceivedDocument', foreign_key: 'recipient_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self


  def jwt_payload
    super
  end
end
