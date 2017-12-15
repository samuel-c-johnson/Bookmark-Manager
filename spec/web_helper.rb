def add_links
  visit ('/')
  fill_in :url, with: 'www.bbc.co.uk/sport'
  fill_in :title, with: 'BBC Sport'
  fill_in :tag, with: 'Sport'
  click_button 'Add'
  fill_in :url, with: 'www.google.com'
  fill_in :title, with: 'Internet search'
  fill_in :tag, with: 'Search'
  click_button 'Add'
end


def fill_in_form_links
  visit ('/')
  fill_in :url, with: 'www.bbc.co.uk/sport'
  fill_in :title, with: 'BBC Sport'

end

def log_in
  visit ('/users/new')
  fill_in :email, with: 'sam@email.com'
  fill_in :password, with: 'passsword'
  click_button ('Submit')
end
