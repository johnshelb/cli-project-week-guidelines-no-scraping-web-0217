class ArticleModel

    attr_reader :results

    def initialize(results)
        @results = interpret_results(results)
        #@title =
    end

    def interpret_results(results)
        interpreted_results = []
        #binding.pry
        list = results["response"]["docs"]
        list.each_with_index do |result, index|
            binding.pry
            temp_result = {
                :web_url => results["response"]["docs"][index]["web_url"],
                :snippet => results["response"]["docs"][index]["snippet"],
                #:by_line => results["response"]["docs"][index]["byline"]["original"],
                :pub_date => results["response"]["docs"][index]["pub_date"]
            }
            interpreted_results << temp_result
        end
        interpreted_results
    end

    def display_results
        #binding.pry
        results.each_with_index do |result, index|
            #binding.pry
            puts "****************************************"
            puts "Web URL: #{results[index][:web_url]}"
            puts "#{results[index][:snippet]}"
            #puts "Author: #{results[index][:byline]}"
            puts "Published: #{results[index][:pub_date]}"
            puts "****************************************"
        end
    end
end
