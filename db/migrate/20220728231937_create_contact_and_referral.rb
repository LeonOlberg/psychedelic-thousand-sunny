class CreateContactAndReferral < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts, id: :uuid do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.text :address
      
      t.timestamps
    end

    create_table :referrals, id: :uuid do |t|
      t.belongs_to :contact, index: true, foreing_key: true
      t.string :name, null: false
      t.string :email, null: false
      
      t.timestamps
    end
  end
end
