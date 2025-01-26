# frozen_string_literal: true

lib = File.expand_path("../lib", __dir__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require_relative "rwiki_links/version"

module RwikiLinks
  autoload :CombineCiteWeb, "rwiki_links/combine_cite_web.rb"
  autoload :BuildCiteWebParams, "rwiki_links/build_cite_web_params.rb"
  autoload :ParseUrl, "rwiki_links/parse_url.rb"
  autoload :GetHostWithoutWeb, "rwiki_links/get_host_without_web.rb"
  autoload :GetHtmlPage, "rwiki_links/get_html_page.rb"
  autoload :GetTitle, "rwiki_links/get_title.rb"
  autoload :GetLang, "rwiki_links/get_lang.rb"
  autoload :GetPublisher, "rwiki_links/get_publisher.rb"
  autoload :GetDate, "rwiki_links/get_date.rb"
  autoload :GetAuthor, "rwiki_links/get_author.rb"

  def self.citeweb(url)
    cite_web_params = BuildCiteWebParams.call(url)
    CombineCiteWeb.call(cite_web_params)
  end
end
