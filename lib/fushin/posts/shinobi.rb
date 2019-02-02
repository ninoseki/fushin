# frozen_string_literal: true

module Fushin
  module Posts
    class Shinobi < Post
      def main_selector
        "#primary > div.inner > div > div:nth-child(3)"
      end

      def main_cleanup_selectors
        %w(script)
      end

      def attachements
        @attachements ||= doc.css("#primary > div.inner > div > div:nth-child(3) > a").map do |a|
          url = a.get("href")
          next unless url

          Models::Attachment.new url
        end.compact
      end
    end
  end
end
