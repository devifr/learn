require 'spec_helper'

	describe "Static pages" do
		describe "Home page" do
			it "should have the content 'Learn at Domikado'" do
				visit '/static_pages/home'
				page.should have_content('Learn at Domikado')
			end
			it "should have the right title" do
				visit '/static_pages/home'
				page.should have_selector('title',
				:text => "Learn at Domikado | Home")
		end
		end
	describe "Help page" do
		it "should have the content 'Help'" do
			visit '/static_pages/help'
			page.should have_content('Help')
		end
		it "should have the right title" do
			visit '/static_pages/help'
			page.should have_selector('title',
			:text => "Learn at Domikado | Help")
		end
	end
	describe "About Page" do
		it "should have the content 'About Us'" do
			visit '/static_pages/about'
			page.should have_content('About Us')
		end
		it "should have the right title" do
			visit '/static_pages/about'
			page.should have_selector('title',
			:text => "Learn at Domikado | About Us")
		end
	end
end
