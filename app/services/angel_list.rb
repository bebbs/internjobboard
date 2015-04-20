require 'httparty'
require 'json'

def is_internship? job
  job['job_type'] == 'internship'
end

def is_in_london? job
  job['tags'].any? {|hash| hash['display_name'] == 'London'}
end

def posted_today? job
  job['created_at'][0..10] == Time.now.strftime("%Y-%m-%d")
end

def build_internship job
  Job.create(role: job['title'], url: job['angellist_url'], company: job['startup']['name'])
end

def create_jobs hash
  hash['jobs'].each do |job|
    build_internship(job) if (is_internship?(job) && is_in_london?(job))
  end
end

page = 1
while Job.all.length < 20
  response = HTTParty.get("https://api.angel.co/1/jobs?access_token=dc01000daed664c4657b0b04649323766893367905b6dacc;page=#{page}")
  hash = JSON.parse(response.body)
  create_jobs(hash)
  page += 1
end
