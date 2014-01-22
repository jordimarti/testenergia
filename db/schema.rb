# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140108104550) do

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "experts", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "experts", ["email"], name: "index_experts_on_email", unique: true, using: :btree
  add_index "experts", ["reset_password_token"], name: "index_experts_on_reset_password_token", unique: true, using: :btree

  create_table "projects", force: true do |t|
    t.integer  "user_id"
    t.integer  "expert_id"
    t.string   "name"
    t.string   "region"
    t.string   "address"
    t.string   "cadastre"
    t.string   "construction_period"
    t.string   "project_type"
    t.decimal  "area",                    precision: 10, scale: 2
    t.string   "facade_improvements"
    t.string   "roof_improvements"
    t.string   "window_type"
    t.string   "window_improvements"
    t.string   "hot_water_type"
    t.string   "hot_water_improvements"
    t.string   "heating_type"
    t.string   "heating_improvements"
    t.string   "cooling_type"
    t.string   "cooling_improvements"
    t.decimal  "contracted_power",        precision: 10, scale: 2
    t.integer  "refrigerator_power"
    t.integer  "microwave_power"
    t.integer  "washingmachine_power"
    t.integer  "dishwasher_power"
    t.integer  "oven_power"
    t.integer  "vitroceramic_power"
    t.integer  "tv_power"
    t.integer  "pc_power"
    t.integer  "stereo_power"
    t.integer  "coffeemachine_power"
    t.string   "lighting_type"
    t.string   "lighting_improvements"
    t.integer  "lighting_power"
    t.string   "ventilation_type"
    t.string   "solarprotection_type"
    t.string   "maintenance_type"
    t.string   "energy_class_guess"
    t.string   "energy_class"
    t.string   "electricity_consumption"
    t.string   "gas_consumption"
    t.string   "gasoil_consumption"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "surname1"
    t.string   "surname2"
    t.integer  "expert_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "xprojects", force: true do |t|
    t.integer  "user_id"
    t.integer  "expert_id"
    t.string   "name"
    t.string   "region"
    t.string   "address"
    t.string   "cadastre"
    t.string   "construction_period"
    t.string   "project_type"
    t.decimal  "area",                    precision: 10, scale: 2
    t.string   "facade_improvements"
    t.string   "roof_improvements"
    t.string   "window_type"
    t.string   "window_improvements"
    t.string   "hot_water_type"
    t.string   "hot_water_improvements"
    t.string   "heating_type"
    t.string   "heating_improvements"
    t.string   "cooling_type"
    t.string   "cooling_improvements"
    t.decimal  "contracted_power",        precision: 10, scale: 2
    t.integer  "refrigerator_power"
    t.integer  "microwave_power"
    t.integer  "washingmachine_power"
    t.integer  "dishwasher_power"
    t.integer  "oven_power"
    t.integer  "vitroceramic_power"
    t.integer  "tv_power"
    t.integer  "pc_power"
    t.integer  "stereo_power"
    t.integer  "coffeemachine_power"
    t.string   "lighting_type"
    t.string   "lighting_improvements"
    t.integer  "lighting_power"
    t.string   "ventilation_type"
    t.string   "solarprotection_type"
    t.string   "maintenance_type"
    t.string   "energy_class_guess"
    t.string   "energy_class"
    t.string   "electricity_consumption"
    t.string   "gas_consumption"
    t.string   "gasoil_consumption"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
