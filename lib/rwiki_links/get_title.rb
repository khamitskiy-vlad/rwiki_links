# frozen_string_literal: true

module RwikiLinks
  class GetTitle
    def self.call(...) = new(...).call

    def initialize(page)
      @page = page
    end

    def call
      cleanup_title
    end

    private

    TITLE_XPATH = "//title"
    private_constant :TITLE_XPATH

    TITLE_CLEANUP_REGEX = %r{
      -\sNEWS                     |
      \sна\svc\.ru                |
      -\sРамблер/новости         |
      \s::\s                      |
      —\sЛичный\sопыт\sна\svc\.ru |
      -\sРИА\sНовости             |
      \s\|\s                      |
      —\sРБК                      |
      -\sKP\.RU                   |
      :\sLenta\.ru                |
      –\sКоммерсантъ              |
      -\sИА\sREGNUM               |
      -\sСвободная\sПресса        |
      \s//                      |
      \.\sНовости                 |
      -\sПарламентская\sгазета    |
      —\sРТ\sна\sрусском          |
      -\sМК                       |
      -\sРоссийская\sгазета       |
      -\sВедомости                |
      -\sГазета\.Ru
    }x
    private_constant :TITLE_CLEANUP_REGEX

    attr_reader :page

    def cleanup_title
      title.gsub(TITLE_CLEANUP_REGEX, "").strip
    end

    def title
      page.xpath(TITLE_XPATH).text
    end
  end
end
