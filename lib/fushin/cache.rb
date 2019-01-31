# frozen_string_literal: true

require "lightly"

module Fushin
  class Cache
    attr_reader :cache
    def initialize
      @cache = Lightly.new(dir: "/tmp/fushin", life: "48h")
    end

    def self.get(key)
      new.cache.get key
    end

    def self.save(key, value)
      new.cache.save(key, value)
    end

    def self.cached?(key)
      new.cache.cached? key
    end
  end
end
