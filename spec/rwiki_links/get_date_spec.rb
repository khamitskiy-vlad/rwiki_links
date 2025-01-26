# frozen_string_literal: true

require "spec_helper"
require "rwiki_links/get_date"
require "nokogiri"

RSpec.describe RwikiLinks::GetDate do
  describe ".call" do
    it "extracts the date from the page" do
      html = '<html><script>{"datePublished":"2023-10-05T12:34:56Z"}</script></html>'
      page = Nokogiri::HTML(html)
      result = described_class.call(page, "example.com")
      expect(result).to eq("2023-10-05")
    end

    it "returns an empty string if the date is not found" do
      html = "<html></html>"
      page = Nokogiri::HTML(html)
      result = described_class.call(page, "example.com")
      expect(result).to eq("")
    end
  end
end
