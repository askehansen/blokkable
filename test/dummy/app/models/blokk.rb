class Blokk < Blokkade::Base
  self.kinds = [:text_blokk, :header_blokk]

  has_field_type :text do |name|
    define_method "#{name}=" do |val|
      self.text_fields = text_fields.to_h.tap do |h|
        h[name.to_s] = val
      end
    end
    define_method name do
      text_fields.to_h[name.to_s]
    end
  end

  has_field_type :string do |name|
    define_method "#{name}=" do |val|
      self.string_fields = string_fields.to_h.tap do |h|
        h[name.to_s] = val
      end
    end
    define_method name do
      string_fields.to_h[name.to_s]
    end
  end

end