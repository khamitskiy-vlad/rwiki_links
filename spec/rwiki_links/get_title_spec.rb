# frozen_string_literal: true

require "spec_helper"
require "rwiki_links/get_title"
require "nokogiri"

RSpec.describe RwikiLinks::GetTitle do
  describe ".call" do
    it "extracts and cleans up the title" do
      html = "<html><title>Test - NEWS</title></html>"
      page = Nokogiri::HTML(html)
      result = described_class.call(page)
      expect(result).to eq("Test")
    end
  end
end
