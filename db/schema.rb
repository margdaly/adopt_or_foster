

ActiveRecord::Schema[7.0].define(version: 2023_11_14_210308) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pets", force: :cascade do |t|
    t.boolean "adoptable", default: true
    t.string "breed", limit: 4
    t.string "name"
    t.bigint "shelter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shelter_id"], name: "index_pets_on_shelter_id"
  end

  create_table "shelters", force: :cascade do |t|
    t.boolean "foster_program"
    t.string "name"
    t.string "city", default: "Denver"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "pets", "shelters"
end
