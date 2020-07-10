class Blokk < Blokkade::Base
  self.kinds = [:text_blokk, :header_blokk]

  has_field_type :rich_text do |name|
    has_rich_text name
  end
  has_field_type :checkbox, adapter: :json
  has_field_type :text, adapter: :json
  has_field_type :string, adapter: :json

end