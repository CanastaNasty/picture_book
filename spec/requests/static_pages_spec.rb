require 'spec_helper'

describe "StaticPages" do
  
  subject { page }

  describe "Home page" do
    before { visit root_path } 

    it { should have_selector('h1',    text: 'Picture Book') }
    it { should have_selector('title', text: full_title('')) }
  end 

  describe "About Page" do
    before { visit about_path}

  	it { should have_selector('h1',    text: 'About') }
    it { should have_selector('title', text: full_title('About')) }
  end

  describe "Contact page" do
    before { visit contact_path}
    
    it { should have_selector('h1',    text: 'Contact') }
    it { should have_selector('title', text: full_title('Contact')) }
  end
end
