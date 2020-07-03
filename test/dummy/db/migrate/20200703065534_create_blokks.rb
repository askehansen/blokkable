class CreateBlokks < ActiveRecord::Migration[6.0]
  def change
    create_table :blokks do |t|
      t.string :kind
      t.integer :owner_id
      t.integer :position
    end
  end
end
