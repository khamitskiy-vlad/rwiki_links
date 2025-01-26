# frozen_string_literal: true

require "nokogiri"
require "net/http"
require "uri"

module RwikiLinks
  class GetHtmlPage
    def self.call(...) = new(...).call

    def initialize(uri)
      @uri = uri
    end

    def call
      html_from_uri_response_body
    end

    private

    attr_reader :uri

    def html_from_uri_response_body
      Nokogiri::HTML(response.body)
    end

    def response = Net::HTTP.get_response(uri)
  end
end
