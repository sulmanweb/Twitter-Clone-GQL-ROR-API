# frozen_string_literal: true

# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tweet_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_likes_on_tweet_id  (tweet_id)
#  index_likes_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (tweet_id => tweets.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'has a valid factory' do
    like = build(:like)
    expect(like).to be_valid
  end

  describe 'validations' do
    subject { build(:like) }
    it { should belong_to(:user) }
    it { should belong_to(:tweet) }
  end
end
