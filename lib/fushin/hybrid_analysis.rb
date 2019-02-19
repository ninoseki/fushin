# frozen_string_literal: true

require "json"
require "http"

module Fushin
  class HybridAnalysis
    BASE_URL = "https://www.hybrid-analysis.com"
    VERSION = "v2"

    def quick_url_scan(url)
      payload = {
        scan_type: "all",
        url: url
      }
      res = HTTP.headers(default_headers).post(url_for("/quick-scan/url-to-file"), form: payload)
      if res.code == 200
        JSON.parse(res.body.to_s)
      else
        message = JSON.parse(res.body.to_s).dig("message")
        raise HAResponseError, message
      end
    end

    def self.quick_url_scan(url)
      new.quick_url_scan(url)
    end

    private

    def api_key
      @api_key ||= ENV.fetch("HA_API_KEY")
    end

    def default_headers
      {
        "accept" => "application/json",
        "api-key" => api_key,
        "user-agent" => "Falcon Sandbox",
      }
    end

    def url_for(path)
      "#{BASE_URL}/api/#{VERSION}#{path}"
    end
  end
end
