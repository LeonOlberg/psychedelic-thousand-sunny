class CreateContactAndReferral < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts, id: :uuid do |t|
      t.string :name
      t.string :email
      t.text :address
      
      t.timestamps
    end

    create_table :referrals, id: :uuid do |t|
      t.belongs_to :contact, index: true, foreing_key: true
      t.string :name
      t.string :email
      
      t.timestamps
    end
  end
end
