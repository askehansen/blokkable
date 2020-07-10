class HeaderBlock < Block
  include Blokkade::Blokkable
  field :title, :string
  field :is_big, :checkbox
end