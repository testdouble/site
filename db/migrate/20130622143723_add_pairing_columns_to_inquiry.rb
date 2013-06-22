class AddPairingColumnsToInquiry < ActiveRecord::Migration
  def change
    add_column :inquiries, :pairing_type, :string
    add_column :inquiries, :pairing_motivation, :string
  end
end
