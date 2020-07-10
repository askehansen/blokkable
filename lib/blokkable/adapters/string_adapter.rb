module Blokkable::StringAdapter
  def self.call(name, type, object)
    object.define_method "#{name}=" do |val|
      send("#{type}_fields=", send("#{type}_fields").to_h.tap { |h| h[name.to_s] = val })
    end
    object.define_method name do
      send("#{type}_fields").to_h[name.to_s]
    end
  end
end
