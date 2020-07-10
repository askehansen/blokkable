require "blokkade/engine"
require "blokkade/adapters/boolean_adapter"
require "blokkade/adapters/string_adapter"

module Blokkade
  class UnkownKindError < StandardError
  end
  class UnknownTypeError < StandardError
  end
  class InvalidAdapterError < StandardError
  end
end
