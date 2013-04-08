require 'spec_helper'

describe Book do
  let(:user) { FactoryGirl.create(:user) }
  before { @book = user.books.build(title: "Lorem Ipsum", cover: "Dolor Sit Amet") }

  subject { @book }

  it { should respond_to(:title) }
  it { should respond_to(:cover) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "when user_id is not present" do
  	before { @book.user_id = nil }
  	it { should_not be_valid }
  end

  describe "when title is not present" do
  	before { @book.title = nil }
  	it { should_not be_valid }
  end

  describe "accessible attributes" do
  	it "should not allow access to user_id" do
  		expect do
  			Book.new(user_id: user.id)
  		end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  	end
  end
end
