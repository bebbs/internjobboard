require 'mechanize'

mechanize = Mechanize.new

page = mechanize.get('http://workinstartups.com/job-board/jobs/interns/')

# page.links.each do |link|
#   puts link.href
# end

page.search("ul.job-list li").each do |x|
  puts x.to_s[/at\s(.*?)\sin/m, 1]
end
