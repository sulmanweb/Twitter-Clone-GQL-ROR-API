# frozen_string_literal: true

# == Schema Information
#
# Table name: tweets
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_tweets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Tweet < ApplicationRecord
  ## Validations
  validates :body, presence: true, length: { maximum: 280 }

  ## Relationships
  belongs_to :user
end
