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
    end
  end
end
