class ApplicationController < ActionController::API
  include Knock::Authenticable
end


# count = 0

# User.all.each do |user|
#   if !user.orders.nil?
#     user.orders.each do |order|
#       if !order.e_prescription.nil?
#         if order.e_prescription.prescription_medicines.count > 10
#           med_count = 0
#           order.e_prescription.prescription_medicines.each do |pm|
#             if pm.form == 'TAB' || pm.form == 'CAP'
#               med_count += 1
#             end
#           end
#           if med_count > 10
#             count += 1
#             break
#           end
#         end
#       end
#     end
#   end
# end

# count = 0

# User.where('created_at>=?', Time.new(2018,9,1)).each do |user|
#   if !user.orders.nil?
#     user.orders.where('start_date>=? AND start_date<=?', '2018-09-01', '2019-03-18').each do |order|
#       if !order.e_prescription.nil?
#         if order.e_prescription.prescription_medicines.count > 14
#           med_count = 0
#           order.e_prescription.prescription_medicines.each do |pm|
#             if pm.form == 'TAB' || pm.form == 'CAP'
#               med_count += 1
#             end
#           end
#           if med_count > 10
#             count += 1
#             break
#           end
#         end
#       end
#     end
#   end
# end