class CreateEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :events do |t|
      t.string :location
      t.date :starts_at

      t.timestamps
    end
  end
end
