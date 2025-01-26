# frozen_string_literal: true

require "spec_helper"
require "rwiki_links"

RSpec.describe RwikiLinks do
  it "has a version number" do
    expect(RwikiLinks::VERSION).not_to be nil
  end

  it "can generate a citation" do
    stub_request(:get, "https://example.com")
      .to_return(body: "<html><title>Test</title></html>", status: 200)

    url = "https://example.com"
    citation = RwikiLinks.citeweb(url)
    expect(citation).to be_a(String)
  end
end
