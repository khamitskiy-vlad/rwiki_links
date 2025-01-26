# frozen_string_literal: true

require "spec_helper"
require "rwiki_links/get_publisher"

RSpec.describe RwikiLinks::GetPublisher do
  describe ".call" do
    it "returns the correct publisher for known websites" do
      result = described_class.call("ria.ru")
      expect(result).to eq("РИА Новости")
    end

    it "formats the publisher name for unknown websites" do
      result = described_class.call("theexample.com")
      expect(result).to eq("Example")
    end
  end
end
