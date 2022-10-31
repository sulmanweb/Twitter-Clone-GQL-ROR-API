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
require 'rails_helper'

RSpec.describe User, type: :model do # rubocop:disable Metrics/BlockLength
  it 'has a valid factory' do
    user = build(:user)
    expect(user).to be_valid
  end

  describe 'validations' do # rubocop:disable Metrics/BlockLength
    subject { build(:user) }
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(60) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should allow_value('sulmanweb@gmail.com').for(:email) }
    it { should_not allow_value('sulmanwebgmail.com').for(:email) }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username).case_insensitive }
    it { should allow_value('sulmanweb').for(:username) }
    it { should_not allow_value('@sulmanweb').for(:username) }
    it { should_not allow_value('sulman web').for(:username) }
    it { should_not allow_value('sulman-web').for(:username) }
    it { should_not allow_value('sulman.web').for(:username) }
    it { should allow_value('sulman_web').for(:username) }
    it { should validate_length_of(:bio).is_at_most(160) }
    it { should allow_value('Abcd@1234').for(:password) }
    it { should_not allow_value('abc1234').for(:password) }
    it { should allow_value(nil).for(:bio) }
    it { should have_secure_password }
    it { should allow_value(nil).for(:website) }
    it { should allow_value('https://sulmanweb.com').for(:website) }
    it { should_not allow_value('sulmanweb.com').for(:website) }
    it { should have_many(:tweets).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_many(:retweets).dependent(:destroy) }
  end

  describe 'callbacks' do
    it 'downcases username before save' do
      user = create(:user, username: 'SULMANWEB')
      expect(user.username).to eq('sulmanweb')
    end
  end

  describe 'password_required?' do
    it 'returns true if password is nil' do
      user = build(:user, password: nil)
      expect(user.send(:password_required?)).to be true
    end

    it 'returns false if password_digest is present' do
      user = create(:user)
      expect(user.send(:password_required?)).to be false
    end
  end
end
