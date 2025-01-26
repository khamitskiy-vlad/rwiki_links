# frozen_string_literal: true

require "open-uri"

module RwikiLinks
  class ParseUrl
    def self.call(...) = new(...).call

    def initialize(url)
      @url = url
    end

    def call
      uri
    end

    private

    attr_reader :url

    def uri = URI.parse(url)
  end
end
