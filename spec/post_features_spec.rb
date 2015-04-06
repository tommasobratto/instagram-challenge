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

  context 'viewing posts' do 
    let!(:hhgoa) {Post.create(title: "Holy Hand Grenade of Antioch")}

    scenario 'showing posts' do 
      visit '/posts'
      click_link 'Holy Hand Grenade of Antioch'
      expect(page).to have_content 'Holy Hand Grenade of Antioch'
      expect(current_path).to eq "/posts/#{hhgoa.id}"
      # expect(page).to have_content 'A Reading from the Book of Armaments, Chapter 4, Verses 16 to 20: 
      #                               Then did he raise on high the Holy Hand Grenade of Antioch, saying,
      #                              "Bless this, O Lord, that with it thou mayst blow thine enemies to tiny bits, 
      #                              in thy mercy." And the people did rejoice and did feast upon the lambs and toads and tree-sloths
      #                              and fruit-bats and orangutans and breakfast cereals ... Now did the Lord say, 
      #                              "First thou pullest the Holy Pin. Then thou must count to three. Three shall be the number of the counting 
      #                              and the number of the counting shall be three. Four shalt thou not count, neither shalt thou count two, 
      #                              excepting that thou then proceedeth to three. Five is right out. Once the number three, 
      #                              being the number of the counting, be reached, then lobbest thou the Holy Hand Grenade in the direction 
      #                              of thine foe, who, being naughty in my sight, shall snuff it."'
    end
  end 
end