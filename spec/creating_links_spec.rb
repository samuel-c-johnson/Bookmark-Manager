feature 'Add links' do
  scenario 'After adding a link it is shown on the bookmark page' do
    visit ('/')
    fill_in :url, with: 'www.allgigs.co.uk'
    fill_in :title, :with => 'gigs and tours'
    click_button 'Add'
    expect(current_path).to eq '/'
    expect(page).to have_content 'www.allgigs.co.uk'
  end
end
