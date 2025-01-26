# frozen_string_literal: true

require "spec_helper"
require "rwiki_links/parse_url"

RSpec.describe RwikiLinks::ParseUrl do
  describe ".call" do
    it "parses a valid URL" do
      url = "https://example.com"
      result = described_class.call(url)
      expect(result).to be_a(URI::HTTPS)
      expect(result.host).to eq("example.com")
    end
  end
end
