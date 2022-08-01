class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events, id: :uuid do |t|
      t.string :kind, null: false
      t.jsonb :reference, null: false

      t.timestamps
    end
  end
end
