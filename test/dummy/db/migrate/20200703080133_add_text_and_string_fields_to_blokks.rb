class AddTextAndStringFieldsToBlokks < ActiveRecord::Migration[6.0]
  def change
    add_column :blokks, :string_fields, :json
    add_column :blokks, :text_fields, :json
  end
end
