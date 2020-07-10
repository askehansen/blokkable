class HeaderBlokk < Blokk
  include Blokkade::Blokkable
  field :title, :string
  field :is_big, :checkbox
end