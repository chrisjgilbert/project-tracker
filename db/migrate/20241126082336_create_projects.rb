class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :display_name, null: false

      t.timestamps
    end
  end
end
