require 'spec_helper'

describe "Book pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "book creation" do
    before { visit new_book_path }

    it { should have_selector('title', text: 'New Book') }
    it { should have_selector('h1', text: 'New Book') }

    describe "with invalid information" do

      it "should not create a book" do
        expect { click_button "Create" }.not_to change(Book, :count)
      end

      describe "error messages" do
        before { click_button "Create" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before { fill_in 'book_title', with: "Lorem ipsum" }
      it "should create a book" do
        expect { click_button "Create" }.to change(Book, :count).by(1)
      end
    end
  end

  describe "book destruction" do
    before { FactoryGirl.create(:book, user: user) }

    describe "as correct user" do
      before { visit user_path(user) }

      it "should delete a book" do
        expect { click_link "delete" }.to change(Book, :count).by(-1)
      end
    end
  end
end