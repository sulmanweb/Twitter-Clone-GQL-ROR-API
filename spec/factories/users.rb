# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  bio             :text
#  email           :string           not null
#  location        :string
#  name            :string           not null
#  password_digest :string
#  username        :string           not null
#  website         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email     (email) UNIQUE
#  index_users_on_name      (name)
#  index_users_on_username  (username) UNIQUE
#
FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    username { Faker::Internet.unique.username(specifier: 3..15, separators: %w[_]) }
    password_digest { 'Abcd@1234' }
    name { Faker::Name.name }
    bio { Faker::Lorem.paragraph_by_chars(number: 160) }
    website { Faker::Internet.url }
    location { "#{Faker::Address.city}, #{Faker::Address.country}" }
  end
end
