# frozen_string_literal: true

module RwikiLinks
  class CombineCiteWeb
    def self.call(...) = new(...).call

    def initialize(cite_web_params)
      @params = cite_web_params
    end

    def call
      cite_web
    end

    private

    attr_reader :params

    def cite_web
      "{{cite web" \
      "|author=#{params[:author]}" \
      "|url=#{params[:url]}" \
      "|title=#{params[:title]}" \
      "|lang=#{params[:lang]}" \
      "|website=#{params[:website]}" \
      "|publisher=#{params[:publisher]}" \
      "|date=#{params[:date]}" \
      "|access-date=#{actual_date}}}"
    end

    def actual_date = Time.now.strftime("%Y-%m-%d")
  end
end
