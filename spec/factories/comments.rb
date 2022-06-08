# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    association :user,
                content { 'MyTextttttttttttt' }
  end
end
