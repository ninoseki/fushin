# frozen_string_literal: true

module Fushin
  module Posts
    class Seesaa < Post
      def main_selector
        "#content > div.blog > div > div.text"
      end

      def main_cleanup_selectors
        %w(script iframe .listCategoryArticle)
      end
    end
  end
end
