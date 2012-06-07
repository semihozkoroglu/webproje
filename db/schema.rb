# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120605194859) do

  create_table "admins", :force => true do |t|
    t.string   "isim"
    t.string   "soyisim"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cards", :force => true do |t|
    t.string  "kartid"
    t.integer "aktif"
    t.integer "user_id"
    t.float   "bakiye"
  end

  create_table "harcamas", :force => true do |t|
    t.datetime "zaman"
    t.integer  "adet"
    t.integer  "card_id"
    t.integer  "sube_id"
    t.integer  "urun_id"
    t.float    "tutar"
  end

  create_table "kuls", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sirkets", :force => true do |t|
    t.string "isim"
    t.string "adres"
    t.string "telefon"
    t.string "email"
    t.string "sifre"
  end

  create_table "subes", :force => true do |t|
    t.string  "isim"
    t.integer "sirket_id"
  end

  create_table "uruns", :force => true do |t|
    t.string  "isim"
    t.float   "fiyat"
    t.integer "adet"
    t.integer "sirket_id"
  end

  create_table "users", :force => true do |t|
    t.string  "number"
    t.string  "tc"
    t.string  "isim"
    t.string  "soyisim"
    t.string  "email"
    t.string  "telefon"
    t.string  "password"
    t.date    "dogumgunu"
    t.string  "unvan"
    t.integer "gecici"
  end

  create_table "yuklemes", :force => true do |t|
    t.integer  "card_id"
    t.string   "kartid"
    t.float    "miktar"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "yer"
  end

end
