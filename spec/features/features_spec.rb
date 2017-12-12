feature 'Visit bookmark page' do
  scenario 'Expect the page to load' do
    visit('/')
    expect(page).to have_content("Welcome to your bookmark manager")
  end

  scenario 'Expect to see links on the page' do
    Link.create(title: 'BBC Sport', url: 'http://www.bbc.co.uk/sport')
    visit('/')
    expect(page).to have_content('http://www.bbc.co.uk/sport')
  end
end
