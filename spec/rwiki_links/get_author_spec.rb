# frozen_string_literal: true

require "spec_helper"
require "rwiki_links/get_author"
require "nokogiri"

RSpec.describe RwikiLinks::GetAuthor do
  describe ".call" do
    it "extracts and formats the author name" do
      html = "<html><div><a><span>John Doe</span></a></div></html>"
      page = Nokogiri::HTML(html)
      result = described_class.call(page, "kp.ru")
      expect(result).to eq("Doe, John")
    end

    it "returns an empty string if the author is not found" do
      html = "<html></html>"
      page = Nokogiri::HTML(html)
      result = described_class.call(page, "example.com")
      expect(result).to eq("")
    end
  end
end
