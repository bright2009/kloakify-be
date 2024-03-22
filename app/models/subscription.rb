class Subscription < ApplicationRecord
  belongs_to :user

  enum subscription_type: {
    bronze: 0,
    silver: 1,
    gold: 2
  }


end
