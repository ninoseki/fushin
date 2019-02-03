# frozen_string_literal: true

module Fushin
  module Models
    class BTC < Model
      attr_reader :address
      def initialize(address)
        @address = address
      end

      def title
        "BTC: #{address}"
      end

      def bitcoin_abuse_link
        "https://www.bitcoinabuse.com/reports/#{address}"
      end

      def to_attachements
        [
          {
            fallback: "bitcoinabuse.com link",
            title: title,
            title_link: bitcoin_abuse_link,
            footer: "bitcoinabuse.com",
            footer_icon: "http://www.google.com/s2/favicons?domain=bitcoinabuse.com"
          }
        ]
      end
    end
  end
end
