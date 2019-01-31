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

      def blockchain_link
        "https://www.blockchain.com/btc/address/#{address}"
      end

      def to_attachements
        [
          {
            fallback: "blockchain.com link",
            title: title,
            title_link: blockchain_link,
            footer: "blockchain.com",
            footer_icon: "http://www.google.com/s2/favicons?domain=blockchain.com"
          }
        ]
      end
    end
  end
end
