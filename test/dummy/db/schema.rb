# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_09_26_183821) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "company_name", null: false
    t.string "legal_name", null: false
    t.string "email", null: false
    t.string "phone"
    t.string "fax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "agents", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.uuid "account_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "mobile"
    t.string "phone"
    t.string "fax"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_agents_on_account_id"
    t.index ["email"], name: "index_agents_on_email", unique: true
    t.index ["reset_password_token"], name: "index_agents_on_reset_password_token", unique: true
  end

  create_table "cities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "state_id", null: false
    t.uuid "district_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["district_id"], name: "index_cities_on_district_id"
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "contacts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "type"
    t.uuid "agent_id", null: false
    t.uuid "account_id", null: false
    t.boolean "share", default: false
    t.string "first_name"
    t.string "last_name"
    t.string "company_name"
    t.string "legal_name"
    t.string "job_title"
    t.string "email"
    t.string "phone"
    t.string "mobile"
    t.string "fax"
    t.string "url"
    t.string "registration"
    t.string "source_id"
    t.uuid "business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_contacts_on_account_id"
    t.index ["agent_id"], name: "index_contacts_on_agent_id"
  end

  create_table "contracts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "property_id", null: false
    t.date "eoi_close_on"
    t.date "eoi_inspection_on"
    t.bigint "eoi_minimum_price_cents"
    t.bigint "eoi_target_price_cents"
    t.boolean "for_lease"
    t.boolean "for_sale"
    t.bigint "lease_cleaning_cents"
    t.date "lease_commencement_on"
    t.bigint "lease_covered_parking_sapce_cents"
    t.string "lease_escalation_formulae"
    t.text "lease_escalation_rate"
    t.date "lease_expires_on"
    t.decimal "lease_gross_rent"
    t.decimal "lease_net_rent"
    t.bigint "lease_on_grade_parking_space_cents"
    t.bigint "lease_other_rental_costs_cents"
    t.decimal "lease_outgoings"
    t.date "lease_rent_review_on"
    t.string "lease_term"
    t.bigint "private_treaty_minimum_price_cents"
    t.bigint "private_treaty_target_price_cents"
    t.bigint "sale_actual_sale_price_cents"
    t.date "sale_auction_on"
    t.string "sale_auction_venue"
    t.date "sale_inspection_on"
    t.bigint "sale_price_cents"
    t.bigint "sale_price_from_cents"
    t.bigint "sale_price_to_cents"
    t.bigint "sale_reserve_price_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_contracts_on_property_id"
  end

  create_table "countries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false, comment: "Country name"
    t.string "code", null: false, comment: "ISO 3166-1 alpha-2 code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "state_id", null: false, comment: "State"
    t.string "name", null: false, comment: "District name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_districts_on_state_id"
  end

  create_table "enquiries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "type"
    t.uuid "account_id", null: false
    t.uuid "agent_id"
    t.bigint "property_id"
    t.datetime "enquired_at"
    t.string "first_name"
    t.string "last_name"
    t.string "company_name"
    t.string "email"
    t.string "mobile"
    t.string "message"
    t.string "source_enquiry_id"
    t.string "source_reference_id"
    t.index ["account_id"], name: "index_enquiries_on_account_id"
    t.index ["agent_id"], name: "index_enquiries_on_agent_id"
    t.index ["property_id"], name: "index_enquiries_on_property_id"
  end

  create_table "postal_codes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "city_id", null: false
    t.string "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_postal_codes_on_city_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "type"
    t.uuid "agent_id", null: false
    t.string "internal_id"
    t.string "name"
    t.string "building"
    t.string "estate"
    t.string "floor_level"
    t.string "floor"
    t.string "unit_suite_shop"
    t.string "local_council"
    t.string "land_area_description"
    t.string "hard_stand_yard_description"
    t.string "headline"
    t.string "grabline"
    t.string "keywords"
    t.integer "parking_spaces"
    t.string "parking_commentslifts_escalators_travelators"
    t.string "clear_span_columns"
    t.string "lot_number"
    t.string "crane"
    t.string "entrances_roller_doors_container_access"
    t.string "zoning"
    t.string "disability_access"
    t.string "rating"
    t.decimal "office_area", precision: 10, scale: 2
    t.decimal "warehouse_area", precision: 10, scale: 2
    t.decimal "showroom_area", precision: 10, scale: 2
    t.decimal "storage_area", precision: 10, scale: 2
    t.decimal "production_area", precision: 10, scale: 2
    t.decimal "trading_area", precision: 10, scale: 2
    t.decimal "floor_area", precision: 10, scale: 2
    t.decimal "land_area", precision: 10, scale: 2
    t.decimal "hard_stand_yard_area", precision: 10, scale: 2
    t.decimal "min_clearance_height", precision: 10, scale: 2
    t.decimal "max_clearance_height", precision: 10, scale: 2
    t.decimal "calculated_building_area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "city_id"
    t.uuid "postal_code_id"
    t.index ["agent_id"], name: "index_properties_on_agent_id"
    t.index ["city_id"], name: "index_properties_on_city_id"
    t.index ["postal_code_id"], name: "index_properties_on_postal_code_id"
    t.index ["type"], name: "index_properties_on_type"
  end

  create_table "property_usages", force: :cascade do |t|
    t.bigint "property_id", null: false
    t.uuid "usage_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_property_usages_on_property_id"
    t.index ["usage_id"], name: "index_property_usages_on_usage_id"
  end

  create_table "states", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "country_id", null: false, comment: "Country"
    t.string "name", null: false, comment: "State name"
    t.string "abbreviation", null: false, comment: "Local abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "usages", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "website_domains", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "website_id", null: false
    t.string "domain", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["website_id"], name: "index_website_domains_on_website_id"
  end

  create_table "websites", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "account_id", null: false
    t.string "description", null: false
    t.string "title", null: false
    t.string "keywords", null: false
    t.string "enquiry_email", null: false
    t.string "enquiry_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_websites_on_account_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "agents", "accounts"
  add_foreign_key "cities", "districts"
  add_foreign_key "cities", "states"
  add_foreign_key "contacts", "accounts"
  add_foreign_key "contacts", "agents"
  add_foreign_key "contracts", "properties"
  add_foreign_key "districts", "states"
  add_foreign_key "enquiries", "accounts"
  add_foreign_key "enquiries", "agents"
  add_foreign_key "enquiries", "properties"
  add_foreign_key "postal_codes", "cities"
  add_foreign_key "properties", "agents"
  add_foreign_key "properties", "cities"
  add_foreign_key "properties", "postal_codes"
  add_foreign_key "property_usages", "properties"
  add_foreign_key "property_usages", "usages"
  add_foreign_key "states", "countries"
  add_foreign_key "website_domains", "websites"
  add_foreign_key "websites", "accounts"
end
