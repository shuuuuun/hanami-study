Hanami::Model.migration do
  change do
    create_table :images do
      primary_key :id
      foreign_key :user_id, :users, on_delete: :cascade, null: false
      column :title, String, null: false
      column :image_data, String

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
