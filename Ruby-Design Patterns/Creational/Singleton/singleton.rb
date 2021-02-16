class Singleton
  def self.new
    @instance ||= super
  end
end
