# frozen_string_literal: true

module RwikiLinks
  class GetDate
    def self.call(...) = new(...).call

    def initialize(page, website)
      @page = page
      @website = website
    end

    def call
      date
    end

    private

    DATE_XPATHS = {
      "kp.ru" => "/html/head/meta[24]/@content",
      "vedomosti.ru" => "//header/div/div/time/@datetime",
      "rambler.ru" => "/html/head/meta[15]/@content",
      "rg.ru" => "/html/head/meta[12]/@content",
      "gazeta.ru" => "//div[1]/div[1]/time/@datetime",
      "utro.ru" => "//div[1]/div[1]/div/div[7]/time/@datetime",
      "tass.ru" => "/html/head/meta[13]/@content",
      "mk.ru" => "//main/div[1]/p/span[1]/meta[1]/@content",
      "kommersant.ru" => "/html/head/meta[24]/@content",
      "svpressa.ru" => "/html/head/meta[18]/@content",
      "pnp.ru" => "//script",
      "360tv.ru" => "/html/head/meta[21]/@content",
      "life.ru" => "/html/head/meta[27]/@content",
      "forbes.ru" => "//div[1]/div[1]/div[1]/time/@datetime",
      "russian.rt.com" => "/html/head/meta[21]/@content",
      "news.ru" => "//section/div/time/@datetime",
      "ria.ru" => "//div/div/div/div/div/div[1]/div/div[1]/div[1]/div[6]",
      "rbc.ru" => "//div/div[1]/div[1]/div[1]/div[1]/time/@content",
      "vesti.ru" => "/html/body/div[6]/div/div/div/div/div[1]/article/@data-datepub",
      "interfax.ru" => "/html/head/meta[23]/@content",
      "regnum.ru" => "//div[2]/div[1]/meta[5]/@content",
      "ntv.ru" => "//div/meta[6]/@content",
      "1tv.ru" => "/html/head/meta[29]/@content"
    }.freeze
    private_constant :DATE_XPATHS

    attr_reader :page, :website

    def date
      date_from_xpath&.length == 10 ? date_from_xpath : ""
    end

    def date_from_xpath
      if DATE_XPATHS.key?(website)
        dig_in_existing_date_xpaths
      else
        try_find_date_published
      end
    end

    def dig_in_existing_date_xpaths
      page.xpath(DATE_XPATHS[website]).text.slice(0..9)
    end

    def try_find_date_published
      page.xpath("//script")
          .text
          .match(/datePublished":"([^T]+)T/)
          &.captures
          &.first
    end
  end
end
