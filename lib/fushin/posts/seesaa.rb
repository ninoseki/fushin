# frozen_string_literal: true

module Fushin
  module Posts
    class Seesaa < Post
      def main_selector
        "#content > div.blog > div > div.text"
      end

      def main_cleanup_selectors
        %w(script iframe .listCategoryArticle font)
      end

      def attachements
        @attachements ||= doc.css("div.text > a").map do |a|
          url = a.get("href")
          next unless url
          next unless url.include? "seesaa.net/image/"

          Models::Attachment.new url
        end.compact
      end
    end
  end
end
