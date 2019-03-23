class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_one :product, through: :order_summaries
  has_one :order_summary
end
