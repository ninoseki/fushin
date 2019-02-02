# frozen_string_literal: true

module Fushin
  module Models
    class Attachment < Model
      attr_reader :url
      def initialize(url)
        @url = url
      end

      def sha256
        @sha256 ||= [].tap do |out|
          res = HybridAnalysis.quick_url_scan(url)
          out << res.dig("sha256")
        end.first
      end

      def title
        "HA: #{sha256}"
      end

      def ha_link
        "https://www.hybrid-analysis.com/sample/#{sha256}/"
      end

      def to_attachements
        [
          {
            fallback: "HA link",
            title: title,
            title_link: ha_link,
            footer: "hybrid-analysis.com",
            footer_icon: "http://www.google.com/s2/favicons?domain=hybrid-analysis.com"
          }
        ]
      end
    end
  end
end
