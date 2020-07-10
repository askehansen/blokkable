class Block < ApplicationRecord
  include Blokkade::Model

  has_field_type :rich_text do |name|
    has_rich_text name
  end

  has_field_type :checkbox, adapter: :boolean
  has_field_type :text, adapter: :string
  has_field_type :string, adapter: :string

end