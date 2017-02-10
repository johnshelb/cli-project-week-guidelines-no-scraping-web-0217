require 'pry'
require 'json'
require 'rest-client'
require 'uri'

class NYTimesAPI

    API_KEY = "4cc0591c67de44389a86c422cce0ed76"

    attr_reader :uri, :keyword, :begin_date, :end_date
    attr_accessor :result

    @@search_results = []

    def initialize(keyword, begin_date, end_date)
        @keyword = keyword
        @begin_date = begin_date
        @end_date = end_date
        @page = "0"
        @uri = URI("https://api.nytimes.com/svc/search/v2/articlesearch.json")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        uri.query = URI.encode_www_form(API_query(keyword, begin_date, end_date))
        request = Net::HTTP::Get.new(uri.request_uri)
        #binding.pry
        @result = JSON.parse(http.request(request).body)
        # puts @result.inspect
        #binding.pry
        @@search_results << ArticleModel.new(result).display_results
        #binding.pry
    end

    def API_query(keyword="", begin_date="", end_date="")
        query = {
            "api-key" => API_KEY,
            "q" => @keyword,
            "begin_date" => @begin_date,
            "end_date" => @end_date
        }
    end




end
