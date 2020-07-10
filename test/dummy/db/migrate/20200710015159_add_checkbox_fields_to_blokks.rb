class AddCheckboxFieldsToBlokks < ActiveRecord::Migration[6.0]
  def change
    add_column :blokks, :checkbox_fields, :json
  end
end
