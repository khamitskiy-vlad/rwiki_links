# frozen_string_literal: true

require "spec_helper"
require "rwiki_links/get_lang"
require "nokogiri"

RSpec.describe RwikiLinks::GetLang do
  describe ".call" do
    it "extracts the language from the HTML" do
      html = '<html lang="en-US"></html>'
      page = Nokogiri::HTML(html)
      result = described_class.call(page)
      expect(result).to eq("en")
    end

    it "returns an empty string if lang is not present" do
      html = "<html></html>"
      page = Nokogiri::HTML(html)
      result = described_class.call(page)
      expect(result).to eq("")
    end
  end
end
