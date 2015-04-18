feature 'Job' do
  context 'Listing all jobs' do
    scenario 'No jobs by default' do
      visit '/'
      expect(page).to have_content 'There are currently no jobs'
    end
  end
end