class RenameBlokks < ActiveRecord::Migration[6.0]
  def change
    rename_table :blokks, :blocks
  end
end
