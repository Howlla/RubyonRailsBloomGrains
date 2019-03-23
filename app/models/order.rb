class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_many :products, through: :order_summaries
end
