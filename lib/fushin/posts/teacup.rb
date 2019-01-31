# frozen_string_literal: true

module Fushin
  module Posts
    class Teacup < Post
      def main_selector
        "#tcmainlay > div.postdate > div > div.postbody"
      end

      def main_cleanup_selectors
        %w(script .tagword)
      end
    end
  end
end
