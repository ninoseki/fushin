# frozen_string_literal: true

module Fushin
  module Posts
    class Sblo < Post
      def main_selector
        "div.WordSection1"
      end

      def main_cleanup_selectors
        %w(.posted)
      end

      def attachements
        @attachements ||= doc.css("div.text > a").map do |a|
          url = a.get("href")
          next unless url
          next unless url.include? "/sblo_files/"

          Models::Attachment.new url
        end.compact
      end
    end
  end
end
