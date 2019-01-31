# frozen_string_literal: true

module Fushin
  class Item
    attr_reader :title, :link

    def initialize(title:, link:)
      @title = title
      @link = link
    end

    def post
      @post ||= [].tap do |out|
        case link
        when /jugem\.jp/
          out << Posts::Jugem.new(link)
        when /kikey\.net/
          out << Posts::Kikey.new(link)
        when /seesaa\.net/
          out << Posts::Seesaa.new(link)
        when /shinobi\.jp/
          out << Posts::Shinobi.new(link)
        when /teacup\.com/
          out << Posts::Teacup.new(link)
        else
          raise NoMachingPostsError
        end
      end.first
    end
  end
end
