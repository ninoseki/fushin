# frozen_string_literal: true

module Fushin
  class Monitor
    attr_reader :rss
    def initialize
      @rss = RSS.new
    end

    def check
      rss.items.each do |item|
        next if Cache.cached?(item.link)

        attachements = [].tap do |out|
          out << item.post.btcs.map(&:to_attachements)
          out << item.post.urls.map(&:to_attachements)
          out << item.post.attachements.map(&:to_attachements)
        end.flatten
        attachements << { text: "IoC is not found." } if attachements.empty?
        Notifier.notify("#{item.title} (#{item.link})", attachements)
      rescue StandardError => e
        attachements = []
        attachements << { text: "#{e.class} (#{e}) is happened during processing." }
        Notifier.notify("#{item.title} (#{item.link})", attachements)
      ensure
        Cache.save(item.link, true)
      end
    end

    def self.check
      new.check
    end
  end
end
