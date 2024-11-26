class CreateStatusTransitions < ActiveRecord::Migration[8.0]
  def change
    create_table :status_transitions do |t|
      t.integer :from, null: false
      t.integer :to, null: false

      t.timestamps
    end
  end
end
