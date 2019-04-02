# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{email:'9205266153',name:"Bhavye", password:'12345678', password_confirmation:'12345678'},{email:'9891438414',name:"Ayush", password:'12345678', password_confirmation:'12345678'}])
Product.create([{name:'Diamond',rate:55},{name:'Platinum',rate:45},{name:'Gold',rate:35}])