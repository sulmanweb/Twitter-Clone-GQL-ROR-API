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
# :nodoc:
class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, length: { maximum: 60 }
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    format: { with: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/,
                              message: I18n.t('errors.models.user.format_email') }
  validates :username, presence: true, uniqueness: { case_sensitive: false },
                       format: { with: /\A(?=.*\w)\w{3,15}\z/,
                                 message: I18n.t('errors.models.user.format_username') }
  validates :password, format: { with: /\A(?=.*).{8,72}\z/, message: I18n.t('errors.models.user.format_password') },
                       if: :password_required?
  validates :bio, length: { maximum: 160 }, allow_blank: true
  validates :website,
            format: { with: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/,
                      message: I18n.t('errors.models.user.format_website') }, allow_blank: true

  ## Relationships
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :retweets, dependent: :destroy

  ## Callbacks
  before_save :downcase_email!
  before_save :downcase_username!

  private

  # is password required for user?
  def password_required?
    password_digest.nil? || password.present?
  end

  # downcase email
  def downcase_email!
    email&.downcase!
  end

  # downcase username
  def downcase_username!
    username&.downcase!
  end
end
