# frozen_string_literal: true

require "digest/sha2"
require "uri"

module Fushin
  module Models
    class Website < Model
      attr_reader :url
      def initialize(url)
        @url = url
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

      def url_for_vt
        uri.path.empty? ? "#{url}/" : url
      end

      def vt_link
        "https://www.virustotal.com/#/url/#{Digest::SHA256.hexdigest(url_for_vt)}"
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
