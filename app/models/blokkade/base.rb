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
      if klass && klass.superclass == Blokk
        klass
      else
        raise UnkownBlokkError, "#{kind} is not a valid blokk kind"
      end
    end

    def to_kind
      Blokk[kind].find(self.id)
    end

    def as_kind
      Blokk[kind].from(self)
    end

    class UnkownBlokkError < StandardError
    end
    class UnknownTypeError < StandardError
    end
    class InvalidAdapterError < StandardError
    end

  end
end
