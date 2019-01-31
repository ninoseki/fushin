# frozen_string_literal: true

module Fushin
  module Posts
    class Kikey < Post
      def main_selector
        "#categoryBlog > div.entryBody"
      end

      def main_cleanup_selectors
        []
      end
    end
  end
end
