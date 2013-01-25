require 'twitter'
require 'pp'

search_terms = ["ford", "ferrari", "honda"]
@total = 0

def search_for search_term
  puts "#{search_term.upcase}"
  term_total = 0
  results = Twitter.search(search_term, 
    :since => "2013-01-17", :until => "2013-01-19",
    :geocode => "21.3069,-157.8583,20mi", 
    :rpp => 100, 
    :result_type => "recent")
  results.statuses.each_with_index do |status, i|
    puts "#{i+1}) #{status.text} - #{status.user.screen_name}"
    @total += 1
    term_total += 1
  end
  puts "Term Total: #{term_total} (#{search_term.upcase})"
end

search_terms.each do |search_term|
  puts "="*20
  search_for search_term
end

puts "\nTotal Hits: #{@total}"
