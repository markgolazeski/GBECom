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

ActiveRecord::Schema.define(:version => 20110604050453) do

  create_table "photos", :force => true do |t|
    t.string   "href",                                       :null => false
    t.string   "owner"
    t.integer  "elo_rating",               :default => 1000
    t.integer  "match_count",              :default => 0
    t.string   "is_portrait", :limit => 1, :default => "N"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", :force => true do |t|
    t.string   "address"
    t.integer  "photo_id_winner"
    t.integer  "photo_id_loser"
    t.integer  "winner_original_rating"
    t.integer  "loser_original_rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
