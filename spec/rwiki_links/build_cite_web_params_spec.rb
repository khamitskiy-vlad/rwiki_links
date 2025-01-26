# frozen_string_literal: true

require "spec_helper"
require "rwiki_links/build_cite_web_params"

RSpec.describe RwikiLinks::BuildCiteWebParams do
  describe ".call" do
    it "builds the citation parameters" do
      allow(RwikiLinks::ParseUrl).to receive(:call).and_return(URI.parse("https://example.com"))
      allow(RwikiLinks::GetHostWithoutWeb).to receive(:call).and_return("example.com")
      allow(RwikiLinks::GetHtmlPage).to receive(:call).and_return(Nokogiri::HTML("<html></html>"))
      allow(RwikiLinks::GetTitle).to receive(:call).and_return("Test Title")
      allow(RwikiLinks::GetLang).to receive(:call).and_return("en")
      allow(RwikiLinks::GetPublisher).to receive(:call).and_return("Example Publisher")
      allow(RwikiLinks::GetDate).to receive(:call).and_return("2023-10-05")
      allow(RwikiLinks::GetAuthor).to receive(:call).and_return("John Doe")

      result = described_class.call("https://example.com")
      expect(result).to eq({
                             url: "https://example.com",
                             website: "example.com",
                             title: "Test Title",
                             lang: "en",
                             publisher: "Example Publisher",
                             date: "2023-10-05",
                             author: "John Doe"
                           })
    end
  end
end
