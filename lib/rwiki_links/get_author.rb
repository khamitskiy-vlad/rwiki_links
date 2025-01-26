# frozen_string_literal: true

module RwikiLinks
  class GetAuthor
    def self.call(...) = new(...).call

    def initialize(page, website)
      @page = page
      @website = website
    end

    def call
      swap_author_first_name_with_last_name
    end

    private

    AUTHOR_XPATHS = {
      "kp.ru" => "//a/span",
      "vedomosti.ru" => "//div/div/header/div[2]/div[2]/div[1]/div/div/a",
      "rbc.ru" => "//div[3]/meta[1]/@content",
      "rambler.ru" => "//header/div/div/div/div/div/a",
      "rg.ru" => "//div/div[2]/div[3]/div/div/div/div[2]/div[1]/div[1]/div[3]/div/div/a",
      "gazeta.ru" => "//span/a",
      "utro.ru" => "//div/a/span",
      "tass.ru" => "//div/div/span",
      "mk.ru" => "//div/div/ul/li/a",
      "kommersant.ru" => "//div/article/footer/ul/li/span/a/span",
      "svpressa.ru" => "//article/div/header/div/div/a/span",
      "pnp.ru" => "//article/div[1]/div[2]/div[1]/p/a",
      "360tv.ru" => "//article/footer/div/a/div/p",
      "life.ru" => "/html/head/script",
      "forbes.ru" => "//article/div/footer/div/div/ul/li/a/div/p",
      "vc.ru" => "//script",
      "lenta.ru" => "//script"
    }.freeze
    private_constant :AUTHOR_XPATHS

    attr_reader :page, :website

    def author_first_and_last_names
      return "" unless AUTHOR_XPATHS.key?(website)

      dig_in_existing_author_xpaths
    end

    def dig_in_existing_author_xpaths
      page.xpath(AUTHOR_XPATHS[website]).text.strip
    end

    def author_splited_first_and_last_names
      author_first_and_last_names.split
    end

    def swap_author_first_name_with_last_name
      author_splited_first_and_last_names[0..1].reverse.join(", ").slice(0..30)
    end
  end
end
