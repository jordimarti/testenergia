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

ActiveRecord::Schema.define(version: 20140331154207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "autotests", force: true do |t|
    t.string   "building_town"
    t.string   "construction_period"
    t.string   "construction_year"
    t.string   "project_type"
    t.string   "facade_improvements"
    t.string   "roof_improvements"
    t.string   "window_type"
    t.string   "window_tightness"
    t.string   "hot_water_type"
    t.string   "hot_water_age"
    t.string   "heating_age"
    t.string   "cooling_type"
    t.string   "cooling_age"
    t.string   "lighting_type"
    t.string   "energy_class_guess"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "building_systems", force: true do |t|
    t.string   "name"
    t.string   "system_type"
    t.integer  "score"
    t.string   "thickness"
    t.integer  "before1800"
    t.integer  "y1800"
    t.integer  "y1810"
    t.integer  "y1820"
    t.integer  "y1830"
    t.integer  "y1840"
    t.integer  "y1850"
    t.integer  "y1860"
    t.integer  "y1870"
    t.integer  "y1880"
    t.integer  "y1890"
    t.integer  "y1900"
    t.integer  "y1910"
    t.integer  "y1920"
    t.integer  "y1930"
    t.integer  "y1940"
    t.integer  "y1950"
    t.integer  "y1960"
    t.integer  "y1970"
    t.integer  "y1980"
    t.integer  "y1990"
    t.integer  "y2000"
    t.integer  "y2010"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "default_improvements", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "category"
    t.integer  "measure_type"
    t.integer  "cost"
    t.integer  "energy_savings"
    t.integer  "emissions_savings"
    t.integer  "economic_savings"
    t.integer  "roi"
    t.integer  "difficulty"
    t.integer  "better_comfort"
    t.integer  "better_healthiness"
    t.integer  "better_security"
    t.integer  "less_noise"
    t.integer  "less_airflow"
    t.integer  "less_moisture"
    t.integer  "less_maintenance"
    t.integer  "water_savings"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experts", force: true do |t|
    t.string   "email",                     default: "", null: false
    t.string   "encrypted_password",        default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",             default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "expert_first_name"
    t.string   "expert_surname1"
    t.string   "expert_surname2"
    t.string   "expert_id_document_type"
    t.string   "expert_id_document_number"
    t.string   "expert_telephone"
    t.string   "expert_mobile_phone"
    t.string   "expert_address"
    t.string   "expert_zip_code"
    t.string   "expert_town"
    t.string   "expert_province"
    t.string   "title"
    t.string   "referee_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "experts", ["email"], name: "index_experts_on_email", unique: true, using: :btree
  add_index "experts", ["reset_password_token"], name: "index_experts_on_reset_password_token", unique: true, using: :btree

  create_table "improvements", force: true do |t|
    t.integer  "xproject_id"
    t.string   "name"
    t.text     "description"
    t.integer  "measure_type"
    t.integer  "cost"
    t.integer  "energy_savings"
    t.integer  "emissions_savings"
    t.integer  "economic_savings"
    t.integer  "roi"
    t.integer  "difficulty"
    t.integer  "better_comfort"
    t.integer  "better_healthiness"
    t.integer  "better_security"
    t.integer  "less_noise"
    t.integer  "less_airflow"
    t.integer  "less_moisture"
    t.integer  "less_maintenance"
    t.integer  "water_savings"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.integer  "user_id"
    t.integer  "expert_id"
    t.string   "name"
    t.string   "building_address"
    t.string   "building_zip_code"
    t.string   "building_town"
    t.string   "construction_period"
    t.string   "construction_year"
    t.string   "project_type"
    t.decimal  "area",                    precision: 10, scale: 2
    t.string   "facade_improvements"
    t.string   "roof_improvements"
    t.string   "window_type"
    t.string   "window_tightness"
    t.string   "hot_water_type"
    t.string   "hot_water_age"
    t.string   "heating_age"
    t.string   "cooling_type"
    t.string   "cooling_age"
    t.string   "lighting_type"
    t.integer  "lighting_power"
    t.decimal  "contracted_power",        precision: 10, scale: 2
    t.integer  "electricity_consumption"
    t.integer  "gas_consumption"
    t.integer  "gasoil_consumption"
    t.boolean  "other_energy_sources"
    t.string   "energy_class_guess"
    t.string   "energy_class"
    t.string   "user_first_name"
    t.string   "user_surname1"
    t.string   "user_surname2"
    t.string   "user_id_document_type"
    t.string   "user_id_document_number"
    t.string   "user_telephone"
    t.string   "user_mobile_phone"
    t.string   "user_email"
    t.string   "user_address"
    t.string   "user_zip_code"
    t.string   "user_town"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "simulations", force: true do |t|
    t.integer  "construction_period"
    t.integer  "hot_water_type"
    t.string   "energy_class"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "towns", force: true do |t|
    t.string   "name"
    t.string   "region"
    t.string   "province"
    t.string   "altitude"
    t.string   "climatic_zone"
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "xprojects", force: true do |t|
    t.integer  "user_id"
    t.integer  "expert_id"
    t.string   "name"
    t.string   "building_address"
    t.string   "building_zip_code"
    t.string   "building_town"
    t.string   "construction_period"
    t.string   "construction_year"
    t.string   "project_type"
    t.decimal  "area",                                  precision: 10, scale: 2
    t.string   "cadastre"
    t.string   "facade_improvements"
    t.string   "roof_improvements"
    t.string   "window_type"
    t.string   "window_tightness"
    t.string   "facade_definition"
    t.integer  "facade_score"
    t.string   "roof_definition"
    t.integer  "roof_score"
    t.string   "floor_definition"
    t.integer  "floor_score"
    t.string   "windows_definition"
    t.integer  "windows_score"
    t.string   "hot_water_type"
    t.string   "hot_water_age"
    t.string   "hot_water_definition"
    t.integer  "hot_water_score"
    t.string   "heating_age"
    t.string   "heating_definition"
    t.integer  "heating_score"
    t.string   "cooling_type"
    t.string   "cooling_age"
    t.string   "cooling_definition"
    t.integer  "cooling_score"
    t.string   "lighting_type"
    t.integer  "lighting_power"
    t.string   "lighting_definition"
    t.integer  "lighting_score"
    t.decimal  "contracted_power",                      precision: 10, scale: 2
    t.string   "appliances_definition"
    t.integer  "appliances_score"
    t.integer  "electricity_consumption"
    t.decimal  "electricity_price",                     precision: 10, scale: 2
    t.decimal  "electricity_emissions",                 precision: 10, scale: 2
    t.integer  "electricity_consumption_improvements"
    t.integer  "gas_consumption"
    t.decimal  "gas_price",                             precision: 10, scale: 2
    t.decimal  "gas_emissions",                         precision: 10, scale: 2
    t.integer  "gas_consumption_improvements"
    t.integer  "gasoil_consumption"
    t.decimal  "gasoil_price",                          precision: 10, scale: 2
    t.decimal  "gasoil_emissions",                      precision: 10, scale: 2
    t.integer  "gasoil_consumption_improvements"
    t.boolean  "other_energy_sources"
    t.string   "energy_class_guess"
    t.string   "energy_class"
    t.decimal  "global_emissions",                      precision: 10, scale: 2
    t.string   "global_emissions_rating"
    t.decimal  "global_primary_energy",                 precision: 10, scale: 2
    t.string   "global_primary_energy_rating"
    t.integer  "total_energy_consumption"
    t.integer  "total_energy_consumption_improvements"
    t.integer  "heating_percentage"
    t.integer  "heating_energy_source"
    t.integer  "cooling_percentage"
    t.integer  "cooling_energy_source"
    t.integer  "hot_water_percentage"
    t.integer  "hot_water_energy_source"
    t.integer  "lighting_percentage"
    t.integer  "appliances_percentage"
    t.string   "user_first_name"
    t.string   "user_surname1"
    t.string   "user_surname2"
    t.string   "user_id_document_type"
    t.string   "user_id_document_number"
    t.string   "user_telephone"
    t.string   "user_mobile_phone"
    t.string   "user_email"
    t.string   "user_address"
    t.string   "user_zip_code"
    t.string   "user_town"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "heating2_percentage"
    t.integer  "heating2_energy_source"
  end

end
