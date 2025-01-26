# frozen_string_literal: true

module RwikiLinks
  class GetHostWithoutWeb
    def self.call(...) = new(...).call

    def initialize(uri)
      @uri = uri
    end

    def call
      host_without_web
    end

    private

    attr_reader :uri

    def host_without_web
      uri.host.sub(/^www\./, "")
    end
  end
end
