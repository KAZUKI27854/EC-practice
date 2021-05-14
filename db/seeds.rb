# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 Customer.create!(
      email: "abc@gmail.com",
      first_name: "太郎",
      last_name: "山田",
      first_name_kana: "タロウ",
      last_name_kana: "ヤマダ",
      password: "abcabc",
      postcode: "1234567",
      address: "東京都渋谷区神南1丁目19-11 パークウェースクエア2",
      phone_number: "09012345678"
    )
