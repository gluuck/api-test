# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'vasya' }
    email { 'vasya@gmail.com' }
    password { '123123' }
  end
end
