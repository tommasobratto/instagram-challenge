require 'rails_helper'

feature 'instagram posts' do 
  
  context 'no posts added' do 
    scenario 'should display "add picture" to the page' do 
      visit '/posts'
      expect(page).to have_content 'no posts added'
      expect(page).to have_link 'submit a post'
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

end