class AddCreatorToEvent < ActiveRecord::Migration[8.1]
  def change
    change_table :events do |t|
      add_reference :events, :user, null: false, foreign_key: true
    end 
  end
end
