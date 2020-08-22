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
        account_name: "F男",
        first_name: "F",
        last_name: "男",
        first_name_kana: "エフ",
        last_name_kana: "オ",
        email: "0@0",
        postal_code: "5420076",
        address: "大阪府大阪市中央区難波4-4-4 難波御堂筋センタービル 8階",
        phone_number: "00088889999",
        is_active: true,
        password: "000000",
      },
      {
        account_name: "A子",
        first_name: "A",
        last_name: "子",
        first_name_kana: "エイ",
        last_name_kana: "子",
        email: "1@1",
        postal_code: "1066223",
        address: "東京都港区六本木3-2-1 住友不動産六本木グランドタワー 23F",
        phone_number: "09177772222",
        is_active: true,
        password: "111111",
      },
      {
        account_name: "ロボ",
        first_name: "ロ",
        last_name: "ボ",
        first_name_kana: "ロ",
        last_name_kana: "ボ",
        email: "2@2",
        postal_code: "1066223",
        address: "東京都港区六本木3-2-1 住友不動産六本木グランドタワー 23F",
        phone_number: "09177772222",
        is_active: true,
        password: "222222",
      }
    ])