class JobsController < ApplicationController

  def index
    @jobs = Job.all if Job.any?
  end

end