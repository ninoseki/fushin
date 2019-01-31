# frozen_string_literal: true

require "http"
require "rss"
require "uri"

module Fushin
  class RSS
    BASE_URL = "https://www.inoreader.com/stream/user/1006141524/tag/%E4%B8%8D%E5%AF%A9%E3%83%A1%E3%83%BC%E3%83%AB"

    def feed
      @feed ||= ::RSS::Parser.parse(body)
    end

    def items
      feed.items.map do |item|
        Item.new(title: item.title, link: item.link)
      end
    end

    def body
      res = HTTP.get(BASE_URL)
      return nil unless res.code == 200

      res.body.to_s
    end
  end
end
