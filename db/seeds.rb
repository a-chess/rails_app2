# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TimecardIndece.create!(target_month: "201804")

# 管理者ユーザー登録
User.create!(name:  "緒方　孝市",
             email: "ogata@test.com",
             password:              "password",
             password_confirmation: "password",
             admin: true)

# 申請区分
Generic.create!(kbn: "K01", key1: 0, data1: "未申請")
Generic.create!(kbn: "K01", key1: 1, data1: "申請中")
Generic.create!(kbn: "K01", key1: 2, data1: "承認")

# 勤務状況
Generic.create!(kbn: "K02", key1: 0, data1: "休日")
Generic.create!(kbn: "K02", key1: 1, data1: "出勤")
Generic.create!(kbn: "K02", key1: 2, data1: "欠勤")
Generic.create!(kbn: "K02", key1: 3, data1: "有給")