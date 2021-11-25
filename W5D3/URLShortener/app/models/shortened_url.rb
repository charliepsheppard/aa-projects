# == Schema Information
#
# Table name: shortened_urls
#
#  id        :bigint           not null, primary key
#  short_url :string
#  long_url  :string           not null
#  user_id   :integer          not null
#
class ShortenedURL < ApplicationRecord
    validates :user_id, :short_url, :long_url, presence: true, uniqueness: true 

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    def self.random_code 
        short_url = SecureRandom.urlsafe_base64
        unless ShortenedURL.exists?(short_url: short_url)
            short_url = SecureRandom.urlsafe_base64
        end

        short_url
    end

    def create!(user, long_url)
        ShortenedURL.random_code
    end
end
