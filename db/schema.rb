# When reading this file you will notice the specific structure, there is also key terminology used within the schema file. 

# t. - this is stating the type of data being stored e.g string, integer, and text, there are many to choose from each having a different use case.

#t.index is useful when a table communicated with another table frequently, it is essentially, like the index of a book except it creates an index of columns that are frequently searched eg. The user_id in the product table. This can dramatically increase the performance of our application

# Each table is a migration of a rails model. When we create a model and migrate that data it will create a table from that migration. 

# E.g rails g model orders name:string description:text quantity:integer  price:decimal product:references

# If we were to run this code within our rails application and then uses rails db:migrate, we would create a new table called orders that has 4 columns: -name -description -quantity -price -product, each of these columns has a data type except the product column it is saying that product references the products table.


ActiveRecord::Schema.define(version: 2021_03_17_103944) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

 n
  #
  # instantiates active storage attachments 
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false # null: false means it is required
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id" 
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end
  # this is the individual image
  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  # The products table is one of the main tables within our application, it was created to store information about each product.
  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "availability"
    t.string "category"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "price", default: "0.0", null: false
    t.index ["user_id"], name: "index_products_on_user_id"
  end
  t.string "resource_type"

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
      t.bigint "user_id"
      t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end
# Connecting our tables using refereces e.g products & users 
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id" 
  add_foreign_key "products", "users"
end
