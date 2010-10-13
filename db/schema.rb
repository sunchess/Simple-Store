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

ActiveRecord::Schema.define(:version => 20100915164159) do

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.integer  "products_counter",              :default => 0
    t.integer  "position",         :limit => 3
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["position"], :name => "index_groups_on_position"

  create_table "products", :force => true do |t|
    t.integer  "group_id"
    t.string   "name"
    t.float    "price"
    t.text     "description"
    t.integer  "position",    :limit => 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["group_id"], :name => "index_products_on_group_id"
  add_index "products", ["name"], :name => "index_products_on_name"
  add_index "products", ["price"], :name => "index_products_on_price"

  create_table "users", :force => true do |t|
    t.string   "email",                                  :null => false
    t.string   "crypted_password",                       :null => false
    t.string   "password_salt",                          :null => false
    t.string   "persistence_token",                      :null => false
    t.string   "single_access_token",                    :null => false
    t.string   "perishable_token",                       :null => false
    t.integer  "login_count",         :default => 0,     :null => false
    t.integer  "failed_login_count",  :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.integer  "role_mask",           :default => 0
    t.boolean  "disable",             :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"

end
