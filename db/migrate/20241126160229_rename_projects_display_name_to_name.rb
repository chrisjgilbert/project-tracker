class RenameProjectsDisplayNameToName < ActiveRecord::Migration[8.0]
  def change
    rename_column :projects, :display_name, :name
  end
end
