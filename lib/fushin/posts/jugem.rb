# frozen_string_literal: true

module Fushin
  module Posts
    class Jugem < Post
      def main_selector
        "div.entry_body"
      end

      def main_cleanup_selectors
        %w(script iframe .service_button)
      end
    end
  end
end
