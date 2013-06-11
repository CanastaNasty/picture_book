FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :book do
  	title "Lorem Ipsum"
  	user
  end

  factory :page do
    sequence(:picture) { |n| "picture_#{n}" }
    sequence(:sound) { |n| "sound_#{n}" }
    sequence(:page_num) { |n| "#{n}" }
  end
end