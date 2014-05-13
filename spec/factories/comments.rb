# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment, :class => 'Comments' do
    user_id 1
    spot_id 1
    content "MyString"
  end
end
