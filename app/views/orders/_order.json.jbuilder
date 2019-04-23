#json.extract! order, :id, :user_id, :address_id, :created_at, :updated_at
#json.url order_url(order, format: :json)

json.id order.id
json.price order.price
json.product order.order_summary.product_id
json.qty order.order_summary.quantity

json.user {
  user = order.user
  json.id user.id
  json.name user.name
  json.number user.email
}
json.address {
  address = order.address
  json.id address.id
  json.line1 address.line1
  json.line2 address.line2
  json.pin_code address.pin_code
  json.user_id order.user.id
}
json.addons order.order_summary.add_ons
json.status order.order_status