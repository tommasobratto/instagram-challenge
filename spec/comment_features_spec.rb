require 'rails_helper'

feature 'leave a comment' do 
  before do 
    Post.create(title: "Holy Hand Grenade of Antioch")
  end

  scenario 'user can leave a comment' do 
    visit '/posts'
    click_link 'Comment on Holy Hand Grenade of Antioch'
    fill_in 'Content', with: "one, two, FIVE!"
    click_button 'Leave Comment'

    expect(current_path).to eq '/posts'
    click_link 'Holy Hand Grenade of Antioch'
    expect(page).to have_content("one, two, FIVE!")
  end
end