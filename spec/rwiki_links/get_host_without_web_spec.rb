# frozen_string_literal: true

require "spec_helper"
require "rwiki_links/get_host_without_web"

RSpec.describe RwikiLinks::GetHostWithoutWeb do
  describe ".call" do
    it 'removes "www." from the host' do
      uri = URI.parse("https://www.example.com")
      result = described_class.call(uri)
      expect(result).to eq("example.com")
    end

    it 'returns the host unchanged if "www." is not present' do
      uri = URI.parse("https://example.com")
      result = described_class.call(uri)
      expect(result).to eq("example.com")
    end
  end
end
