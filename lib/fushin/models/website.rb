# frozen_string_literal: true

require "embiggen"
require "digest/sha2"
require "uri"

module Fushin
  module Models
    class Website < Model
      attr_reader :url
      def initialize(url)
        uri = Embiggen::URI(url)
        @url = uri.expand.to_s
      end

      def uri
        @uri ||= URI(url)
      end

      def domain
        uri.hostname
      end

      def urlscan_link
        "https://urlscan.io/domain/#{domain}"
      end

      def normalized_url
        @normalized_url ||= uri.path.empty? ? "#{url}/" : url
      end

      def vt_link
        "https://www.virustotal.com/#/url/#{Digest::SHA256.hexdigest(normalized_url)}"
      end

      def to_attachements
        [
          {
            fallback: "virustotal.com link",
            title: "VT: #{url}",
            title_link: vt_link,
            footer: "virustotal.com",
            footer_icon: "http://www.google.com/s2/favicons?domain=virustotal.com"
          },
          {
            fallback: "urlscan.io link",
            title: "urlscan.io: #{domain}",
            title_link: urlscan_link,
            footer: "urlscan.io",
            footer_icon: "http://www.google.com/s2/favicons?domain=urlscan.io"
          },
        ]
      end
    end
  end
end
