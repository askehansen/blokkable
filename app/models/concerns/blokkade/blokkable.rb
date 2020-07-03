module Blokkade::Blokkable
  extend ActiveSupport::Concern

  included do
    after_initialize :set_kind
    default_scope -> { where(kind: model.kind_of) }
    @fields = {}
  end

  class_methods do

    def from(blokk)
      self.new(blokk.attributes)
    end

    def kind_of
      to_s.underscore.to_sym
    end

    def fields
      @fields
    end

    def field(name, type = :string)
      unless self.field_types.keys.include? type
        raise Blokk::UnknownTypeError, "#{type} is not a valid field type"
      end

      @fields[name] = type
      self.field_types[type].call(name)
    end

  end

  def to_partial_path
    "blokks/templates/#{kind}"
  end

  def to_kind
    self
  end
  
  def as_kind
    self
  end

  def fields
    self.class.fields.keys.map do |key|
      [key, self.send(key)]
    end.to_h
  end

  private

  def set_kind
    if Blokk.kinds.include? self.class.kind_of
      self.kind = self.class.kind_of
    end
  end
end
