require_relative '../web_helper.rb'

feature 'sign up' do
  scenario 'User enters email and password to log in' do
    log_in
    expect(current_path).to eq('/')
    expect(page).to have_content('Welcome sam@email.com')
    expect{log_in}.to change(User, :count).by(1)
    expect(User.first.email).to eq('sam@email.com')
  end
end
