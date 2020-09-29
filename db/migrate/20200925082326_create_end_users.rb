class CreateEndUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :end_users do |t|
      t.string "first_name"
      t.string "last_name"
      t.string "kana_first_name"
      t.string "kana_last_name"
      t.string "postal_code"
      t.string "address"
      t.string "phone_number"
      t.boolean "is_active_member_status"
      t.datetime "deleted_at"
      t.timestamps
    end
  end
end
