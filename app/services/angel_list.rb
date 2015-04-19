require 'httparty'
require 'json'

file = File.read('app/services/angel_list.json')
hash = JSON.parse(file)
internships = []

hash['jobs'].each do |job|
  if job['job_type'] == 'internship'
    internships << job
  end
end


