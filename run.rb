require 'twitter'

search_terms = ["donut", "croissant", "cupcake", "malasada", "bacon", "meth", "chocolate", "sex", "cookie", "pie"]
@total = 0

def search_for search_term
  # puts "search term: #{search_term}"
  term_total = 0
  p Twitter.search(search_term, 
    :since => "2012-06-19", :until => "2012-06-20",
    :geocode => "21.3069,-157.8583,20mi", 
    :rpp => 100, 
    :result_type => "recent")
  # Twitter.search(search_term, 
  #   :since => "2012-06-19", :until => "2012-06-20",
  #   :geocode => "21.3069,-157.8583,20mi", 
  #   :rpp => 100, 
  #   :result_type => "recent").each_with_index do |status, i|
  #     # puts "#{i+1}) #{status.from_user}: #{status.text}"
  #     @total += 1
  #     term_total += 1
  # end
  puts "#{search_term}: #{term_total}"
end

search_terms.each do |search_term|
  # puts "="*20
  search_for search_term
end
puts "\nTotal Hits: #{@total}"

rate_limit_status = Twitter.rate_limit_status
p "#{rate_limit_status.remaining_hits} Twitter API request(s) remaining for the next #{((rate_limit_status.reset_time - Time.now) / 60).floor} minutes and #{((rate_limit_status.reset_time - Time.now) % 60).round} seconds"