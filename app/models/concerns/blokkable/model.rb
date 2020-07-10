module Blokkable::Model
  extend ActiveSupport::Concern

  included do
    @@field_types = {}
  end

  class_methods do

    def inherited(child)
      child.after_initialize(:set_kind)
      child.default_scopes = [-> { where(kind: model.kind_of) }]
      child.class_variable_set "@@fields", {}
      super
    end

    def field_types
      @@field_types
    end

    def [](kind)
      klass = kind.to_s.camelcase.safe_constantize
      if klass
        klass
      else
        raise Blokkable::UnkownKindError, "#{kind} is not a valid kind"
      end
    end

    def has_field_type(type, adapter: nil, &block)
      if !adapter && !block_given?
        raise Blokkable::InvalidAdapterError, "Use an adapter or a block"
      end

      @@field_types[type] = case adapter
      when nil
        block
      when :string
        Blokkable::StringAdapter
      when :boolean
        Blokkable::BooleanAdapter
      else
        if adapter.respond_to?(:call)
          adapter
        else
          raise Blokkable::InvalidAdapterError, "#{adapter} is not a valid adapter"
        end
      end
    end

    def from(blokk)
      self.new(blokk.attributes)
    end

    def kind_of
      to_s.underscore.to_sym
    end

    def fields
      self.class_variable_get("@@fields")
    end

    def field(name, type = :string)
      unless self.field_types.keys.include? type
        raise Blokkable::UnknownTypeError, "#{type} is not a valid field type"
      end
      fields = self.class_variable_get("@@fields")
      fields[name] = type
      self.class_variable_set("@@fields", fields)
      self.field_types[type].call(name, type, self)
    end

  end

  def to_partial_path
    "#{self.class.superclass.to_s.downcase.pluralize}/templates/#{kind}"
  end

  def fields
    self.class.fields.keys.map do |key|
      [key, self.send(key)]
    end.to_h
  end

  def to_kind
    self.class[kind].find(self.id)
  end

  def as_kind
    self.class[kind].from(self)
  end

  private

  def set_kind
    self.kind = self.class.kind_of
  end
end
