# frozen_string_literal: true

require "charlock_holmes"
require "http"
require "oga"
require "uri"
require "yaml"
require "url_regex"

module Fushin
  module Posts
    class Post
      attr_reader :url

      def initialize(url)
        @url = url
      end

      def main
        @main ||= [].tap do |out|
          body = doc.at_css(main_selector)

          main_cleanup_selectors.each do |selector|
            body.css(selector).each(&:remove)
          end

          out << body
        end.first
      end

      def btcs
        @btcs ||= main.text.scan(/\b[13][a-km-zA-HJ-NP-Z0-9]{26,33}\b/).uniq.map do |address|
          Models::BTC.new(address)
        end
      end

      def urls
        @urls ||= (urls_in_text + links).uniq.map do |url|
          next if whitelisted_domain?(url)

          Models::Website.new(url)
        end.compact.uniq(&:normalized_url)
      end

      def urls_in_text
        @urls_in_text ||= main.text.scan(UrlRegex.get(scheme_required: true, mode: :parsing))
      end

      def links
        @links ||= main.css("a").map { |a| a.get("href") }.compact.select { |link| link.start_with?("http://", "https://") }
      end

      def attachements
        []
      end

      private

      def main_selector
        raise NotImplementedError, "You must implement #{self.class}##{__method__}"
      end

      def main_cleanup_selectors
        raise NotImplementedError, "You must implement #{self.class}##{__method__}"
      end

      def whitelisted_domain?(url)
        uri = URI(url)
        whitelisted_domains.any? { |domain| uri.hostname.end_with? domain }
      end

      def whitelisted_domains
        @whitelisted_domains ||= YAML.safe_load(
          File.read(File.expand_path("./../config/whitelisted_domains.yml", __dir__))
        )
      end

      def doc
        @doc ||= Oga.parse_html(body)
      end

      def body
        res = HTTP.get(url)
        return nil unless res.code == 200

        detection = CharlockHolmes::EncodingDetector.detect(res.body.to_s)
        CharlockHolmes::Converter.convert(res.body.to_s, detection[:encoding], "UTF-8")
      end
    end
  end
end
