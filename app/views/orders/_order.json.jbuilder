#json.extract! order, :id, :user_id, :address_id, :created_at, :updated_at
#json.url order_url(order, format: :json)

json.id order.id
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
}