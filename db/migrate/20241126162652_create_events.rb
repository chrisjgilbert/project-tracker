class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.references :project, null: false, foreign_key: true
      t.references :eventable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
