# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    association :user
    title { 'SBC' }
    content { 'ADS fvgbfr Bg gggtyhtgr rfr' }
  end
end
