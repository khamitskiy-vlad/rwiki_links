# frozen_string_literal: true

module RwikiLinks
  class GetLang
    def self.call(...) = new(...).call

    def initialize(page)
      @page = page
    end

    def call
      lang
    end

    private

    LANG_XPATH = "/html/@lang"
    private_constant :LANG_XPATH

    attr_reader :page

    def lang
      page.xpath(LANG_XPATH)
          .text
          .split("-")
          .first || ""
    end
  end
end
