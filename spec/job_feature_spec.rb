feature 'Job' do
  context 'Listing all jobs' do
    scenario 'No jobs by default' do
      visit '/'

      expect(page).to have_content 'There are currently no jobs'
    end
  end

  context 'With a job added' do
    scenario 'Displays the job on the homepage' do
      Job.create(role: 'Product Manager', company: 'Acme Inc.', url: 'http://acme.com/internships/product')
      visit '/'

      expect(page).to have_link 'Product Manager', href: 'http://acme.com/internships/product'
      expect(page).to have_content 'Acme Inc.'
    end
  end

end