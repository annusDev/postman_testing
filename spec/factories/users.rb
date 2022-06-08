# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'MyString' }
    role { 'user' }
    email { 'user@gmail.com' }
    encrypted_password { '123456' }
  end
end
