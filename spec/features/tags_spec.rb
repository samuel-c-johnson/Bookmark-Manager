require_relative '../web_helper.rb'

feature 'tags' do
  scenario 'Allows the user to add tags to links' do
    visit ('/')
    fill_in :url, with: 'www.bbc.co.uk/sport'
    fill_in :title, with: 'BBC Sport'
    fill_in :tag, with: 'Sport'
    click_button 'Add'
    link = Link.first
    expect(link.tag.map(&:name)).to include('Sport')
  end

  scenario 'Homepage should have a search bar for tags' do
    visit ('/')
    expect(page).to have_field('tag_search')
  end

  scenario 'Searching for a tag should take you to a new page with the tagged links' do
    add_links
    fill_in :tag_search, with: 'Sport'
    click_button 'Search'
    expect(page).to have_content ('www.bbc.co.uk/sport')
    expect(page).not_to have_content ('www.google.com')
  end

  scenario 'Allows user to add multiple tags for a link' do
    fill_in_form_links
    fill_in :tag, with: 'Sport, News'
    click_button 'Add'
    link = Link.first
    expect(link.tag.count).to eq(2)
  end


end
