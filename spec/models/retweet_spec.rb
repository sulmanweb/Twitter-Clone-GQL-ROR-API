# frozen_string_literal: true

# == Schema Information
#
# Table name: retweets
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tweet_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_retweets_on_tweet_id  (tweet_id)
#  index_retweets_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (tweet_id => tweets.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Retweet, type: :model do
  it 'has a valid factory' do
    retweet = build(:retweet)
    expect(retweet).to be_valid
  end

  describe 'validations' do
    it { should belong_to(:tweet) }
    it { should belong_to(:user) }
  end
end
