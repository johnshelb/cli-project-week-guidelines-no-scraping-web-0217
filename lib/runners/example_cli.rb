class NYTimesCLI

    CURRENT_DAY = Time.now.to_s.split(" ")[0].split("-").join


  def call
    puts "Welcome to the NY Times Article Search"
    puts "What would you like to search?"
    run
  end

  def get_user_input
    gets.chomp.strip
  end

  def run
    puts "Type 'help' for help or 'exit' to exit or 'search' to search"

    input = get_user_input

    if input == "help"
        help
    elsif input == "exit"
        exit
    elsif input == "search"
        query
    end
    run
  end

  def query
    puts "New search keyword: "
    keyword_input = get_user_input
    puts "Would you like to set a date range? (Y/N)"
    user_input = get_user_input
    if user_input.downcase == "y"
        puts "Please input a start date (YYYYMMDD): "
        start_date_input = get_user_input
        puts "Please input an end date (YYYYMMDD): "
        end_date_input = get_user_input
    else
        start_date_input = "19000101"
        end_date_input = CURRENT_DAY
    end

    search(keyword_input, start_date_input, end_date_input)
  end

  def search(keyword_input, start_date_input="19000101", end_date_input=CURRENT_DAY)
    puts "Your search term was #{keyword_input}, I am searching..."
    result_list = NYTimesAPI.new(keyword_input, start_date_input, end_date_input)
    puts "Thank you for your patience. I found this on NY Times: "
  end

  def help
    puts "Type 'exit' to exit"
    puts "Type 'help' to view this menu again"
    puts "Type 'search' to begin searching"
  end

end

a = NYTimesCLI.new
a.run
