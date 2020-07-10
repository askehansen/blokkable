module Blokkade
  class Base < ApplicationRecord
    self.abstract_class = true

    @@field_types = {}

    def self.has_field_type(type, adapter: nil, &block)
      if !adapter && !block_given?
        raise InvalidAdapterError, "Use an adapter or a block"
      end

      @@field_types[type] = case adapter
      when nil
        block
      when :string
        Blokkade::StringAdapter
      when :boolean
        Blokkade::BooleanAdapter
      else
        if adapter.respond_to?(:call)
          adapter
        else
          raise InvalidAdapterError, "#{adapter} is not a valid adapter"
        end
      end
    end

    def self.field_types
      @@field_types
    end

    def self.[](kind)
      klass = kind.to_s.camelcase.safe_constantize
      if klass
        klass
      else
        raise UnkownKindError, "#{kind} is not a valid kind"
      end
    end

    def to_kind
      self.class[kind].find(self.id)
    end

    def as_kind
      self.class[kind].from(self)
    end

    class UnkownKindError < StandardError
    end
    class UnknownTypeError < StandardError
    end
    class InvalidAdapterError < StandardError
    end

  end
end
