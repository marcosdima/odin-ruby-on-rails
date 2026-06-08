class AddEventTitleAndDescription < ActiveRecord::Migration[8.1]
  def change
    change_table :events do |t|
      t.string :title
      t.string :description
    end
  end
end
