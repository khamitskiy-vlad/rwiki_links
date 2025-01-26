# frozen_string_literal: true

require "spec_helper"
require "rwiki_links/combine_cite_web"

RSpec.describe RwikiLinks::CombineCiteWeb do
  describe ".call" do
    it "generates the citation string" do
      params = {
        url: "https://example.com",
        website: "example.com",
        title: "Test Title",
        lang: "en",
        publisher: "Example Publisher",
        date: "2023-10-05",
        author: "John Doe"
      }
      result = described_class.call(params)
      expect(result).to include("|author=John Doe|")
      expect(result).to include("|url=https://example.com|")
      expect(result).to include("|title=Test Title|")
    end
  end
end
