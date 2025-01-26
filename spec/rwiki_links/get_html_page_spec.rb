# frozen_string_literal: true

require "spec_helper"
require "rwiki_links/get_html_page"
require "webmock/rspec"

RSpec.describe RwikiLinks::GetHtmlPage do
  describe ".call" do
    it "fetches and parses the HTML page" do
      stub_request(:get, "https://example.com")
        .to_return(body: "<html><title>Test</title></html>", status: 200)

      uri = URI.parse("https://example.com")
      result = described_class.call(uri)
      expect(result).to be_a(Nokogiri::HTML::Document)
      expect(result.title).to eq("Test")
    end
  end
end
