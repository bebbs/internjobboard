require 'mechanize'
require 'uri'

# page.links.each do |link|
#   puts link.href
# end

def pull_data
	mechanize = Mechanize.new

	page = mechanize.get('http://workinstartups.com/job-board/jobs/interns/')
	page.search("ul.job-list li").each do |x|
    str = x.to_s
    job = Job.new

    job.company = str[/at\s(.*?)\sin/m, 1]
    job.url = URI.extract(str).first
    job.role = x.at_css('a').text

    job.save
  end
end

# def filter_crap
# 	filtered = pull_data.select! { |title| (title.kind_of? String) && (!title.include?("<")) }
# end
