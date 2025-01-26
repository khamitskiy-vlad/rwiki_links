# frozen_string_literal: true

module RwikiLinks
  class GetPublisher
    def self.call(...) = new(...).call

    def initialize(website)
      @website = website
    end

    def call
      publisher
    end

    private

    attr_reader :website

    def exceptions
      {
        "bbc.co.uk" => "BBC",
        "theguardian.com" => "The Guardian",
        "nytimes.com" => "The New York Times"
      }
    end

    def publishers # rubocop:disable Metrics/MethodLength
      {
        "ria.ru" => "РИА Новости",
        "pnp.ru" => "Парламентская газета",
        "russian.rt.com" => "RT",
        "1tv.ru" => "Первый канал",
        "svpressa.ru" => "Свободная Пресса",
        "ntv.ru" => "НТВ",
        "mk.ru" => "Московский Комсомолец",
        "rg.ru" => "Российская Газета",
        "news.ru" => "NEWS.ru",
        "aif.ru" => "Аргументы и Факты",
        "gazeta.ru" => "Газета.Ru",
        "tass.ru" => "ТАСС",
        "kp.ru" => "Комсомольская Правда",
        "rbc.ru" => "РБК",
        "vc.ru" => "VC.ru",
        "vedomosti.ru" => "Ведомости"
      }
    end

    def publisher
      publishers[website] || publisher_from_host
    end

    def publisher_from_host
      return exceptions[website] if exceptions.key?(website)

      website.sub(/^the/, "")
             .sub(/\..*$/, "")
             .capitalize
    end
  end
end
