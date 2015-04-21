require 'mechanize'

	mechanize = Mechanize.new

page = mechanize.get('http://workinstartups.com/job-board/jobs/interns/')

# page.links.each do |link|
#   puts link.href
# end

# page.search("ul.job-list li").each do |x|
#   puts x.to_s[/at\s(.*?)\sin/m, 1]
# end

def pull_data
	mechanize = Mechanize.new
	job_array = []
	page = mechanize.get('http://workinstartups.com/job-board/jobs/interns/')
	page.search("ul.job-list li").each do |x|
  	job_array << x.to_s[/at\s(.*?)\sin/m, 1]
	end
	return job_array
end

def filter_crap
	filtered = pull_data.select! { |title| title.kind_of? String }
	filtered = filtered.delete_if {|title| title.include?("<")}
	filtered.each do |x|
		puts x
		puts x.class
	end
end

pull_data