

feature 'Add a tag' do
  scenario 'Allows the user to add tags to links' do
    visit ('/')
    fill_in :url, with: 'www.bbcsport.co.uk/sport'
    fill_in :title, with: 'BBC Sport'
    fill_in :tag, with: 'Sport'
    click_button 'Add'
    link = Link.first
    expect(link.tag.map(&:name)).to include('Sport')
  end
end
