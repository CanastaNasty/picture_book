require 'spec_helper'

describe "StaticPages" do

	let(:base_title) { "Picture Book" }
  
  	describe "Home Page" do

  		it "should have the title 'Home'" do
  			visit '/static_pages/home'
  			page.should have_selector('title', :text => "#{base_title} | Home")
  		end
  	end

  	describe "About Page" do
  		it "should have the title 'About'" do
  			visit '/static_pages/about'
  			page.should have_selector('title', :text => "#{base_title} | About")
  		end
  	end

  	describe "Contact Page" do
  		it "should have the title 'Contact'" do
  			visit '/static_pages/contact'
  			page.should have_selector('title', :text => "#{base_title} | Contact")
  		end
  	end	  		
end
