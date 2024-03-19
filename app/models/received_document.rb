class ReceivedDocument < ApplicationRecord
  belongs_to :document
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
end
