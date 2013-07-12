require 'spec_helper'

describe "Book pages" do

  subject { page }

  let!(:user) { FactoryGirl.create(:user) }
  let!(:book) { FactoryGirl.create(:book, user: user) }
  before do
    sign_in user  
  end

  describe "index" do
    before { visit books_path }

    it { should have_selector('title', text: 'All books') }
    it { should have_selector('h1',    text: 'All books') }

    describe "pagination" do

      before(:all) { 30.times { FactoryGirl.create(:book, user: user) } }

      it { should have_selector('div.pagination') }

      it "should list each user" do
        Book.paginate(page: 1).each do |book|
          page.should have_selector('li', text: book.title)
        end
      end
    end
  end

  describe "book creation" do
    before { visit new_book_path }

    it { should have_selector('title', text: 'New Book') }
    it { should have_selector('h1', text: 'New Book') }

    describe "with invalid information" do

      it "should not create a book" do
        expect { click_button "Submit" }.not_to change(Book, :count)
      end

      describe "error messages" do
        before { click_button "Submit" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before do
        fill_in 'book_title', with: "Lorem ipsum"
        fill_in 'book_book_pages_attributes_0_picture', with: "/assets/picture_book.png"
      end

      it "should create a book" do
        expect { click_button "Submit" }.to change(Book, :count).by(1)
      end
    end
  end

  describe "book destruction" do

    describe "as correct user" do
      before { visit user_path(user) }

      it "should delete a book" do
        expect { click_link "delete" }.to change(Book, :count).by(-1)
      end
    end
  end

  describe "book show" do
    before { visit book_path(book) }

    it { should have_selector('title', text: full_title(book.title)) }
    it { should have_selector('h1', text: book.title) }

    describe "pagination" do
      before(:all) { 5.times { FactoryGirl.create(:page, book: book) } }
      after(:all) { Book.delete_all }

      it { should have_selector('div.pagination') }
      it { should have_selector('audio') }
    end
  end
  after(:all)  { User.delete_all }
end