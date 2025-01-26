# frozen_string_literal: true

require "memoist"

module RwikiLinks
  class BuildCiteWebParams
    extend Memoist

    def self.call(...) = new(...).call

    def initialize(url)
      @url = url
    end

    def call
      {
        url:,
        website:,
        title:,
        lang:,
        publisher:,
        date:,
        author:
      }
    end

    private

    attr_reader :url

    def uri = ParseUrl.call(url)

    def website = GetHostWithoutWeb.call(uri)

    def page = GetHtmlPage.call(uri)

    def title = GetTitle.call(page)

    def lang = GetLang.call(page)

    def publisher = GetPublisher.call(website)

    def date = GetDate.call(page, website)

    def author = GetAuthor.call(page, website)

    memoize :uri, :website, :page
  end
end
