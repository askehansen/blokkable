require "blokkable/engine"
require "blokkable/adapters/boolean_adapter"
require "blokkable/adapters/string_adapter"

module Blokkable
  class UnkownKindError < StandardError
  end
  class UnknownTypeError < StandardError
  end
  class InvalidAdapterError < StandardError
  end
end
