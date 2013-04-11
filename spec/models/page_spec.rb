require 'spec_helper'

describe Page do
  let(:user) { FactoryGirl.create(:user) }
  let(:book) { FactoryGirl.create(:book) }
  before { @page = book.pages.build(picture: "Lorem", sound: "ipsum") }

  subject { @page }

  it { should respond_to(:picture) }
  it { should respond_to(:sound) }
  it { should respond_to(:book_id) }
  it { should respond_to(:book) }
  its(:book) { should == book }

  it { should be_valid }

  describe "when book_id is not present" do
  	before { @page.book_id = nil }
  	it { should_not be_valid }
  end

  describe "accessible attributes" do
  	it "should_not allow access to book_id" do
  	  expect do
  	    Page.new(book_id: book.id)
  	  end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  	end
  end
end
