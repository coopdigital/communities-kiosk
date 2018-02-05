class AddEnquiryTables < ActiveRecord::Migration[5.1]
  def change
    create_table :scans do |t|
      t.string :uuid, null: false
      t.string :card_number, null: false
      t.string :screen_id, null: false
      t.timestamps
    end

    create_table :communications do |t|
      t.integer :scan_id, null: false
      t.string :communication_type, null: false
      t.timestamps
    end

    add_foreign_key :communications, :scans, on_delete: :cascade
  end
end
