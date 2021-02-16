require 'singleton'

class OtherSingleton
  include Singleton

  # OtherSingleton.new is not allowed
end

