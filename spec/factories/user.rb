# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'vasya' }
    sequence(:email, 5) { |n| "name#{n}@example.com" }
    password { '123123' }
  end
end
