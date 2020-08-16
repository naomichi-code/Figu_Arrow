# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
    [
      {
        account_name: "刃牙",
        first_name: "範馬",
        last_name: "刃牙",
        first_name_kana: "ハンマ",
        last_name_kana: "バキ",
        email: "0@0",
        postal_code: "5420076",
        address: "大阪府大阪市中央区難波4-4-4 難波御堂筋センタービル 8階",
        phone_number: "00088889999",
        is_active: true,
        password: "000000",
      },
      {
        account_name: "花山薫",
        first_name: "ハナヤマ",
        last_name: "カオル",
        first_name_kana: "ハナヤマ",
        last_name_kana: "カオル",
        email: "1@1",
        postal_code: "1066223",
        address: "東京都港区六本木3-2-1 住友不動産六本木グランドタワー 23F",
        phone_number: "09177772222",
        is_active: false,
        password: "111111",
      }
    ])