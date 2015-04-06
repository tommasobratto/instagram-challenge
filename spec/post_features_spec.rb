require 'rails_helper'

feature 'instagram posts' do 
  
  context 'no posts added' do 
    scenario 'should display "add picture" to the page' do 
      visit '/posts'
      expect(page).to have_content 'no posts added'
      expect(page).to have_link 'create a post'
    end
  end

  context 'post added' do 
    before do 
      Post.create(title: 'Holy Hand Grenade of Antioch')
    end

    scenario 'display post' do 
      visit '/posts'
      expect(page).not_to have_content 'no posts added'
      expect(page).to have_content 'Holy Hand Grenade of Antioch'
    end
  end

  context 'creating post' do 
    scenario 'add a post' do
      visit '/posts'
      click_link 'create a post'
      fill_in 'Title', with: 'Holy Hand Grenade of Antioch'
      click_button 'Create Post'
      expect(page).to have_content 'Holy Hand Grenade of Antioch'
      expect(current_path).to eq '/posts'
    end
  end

end