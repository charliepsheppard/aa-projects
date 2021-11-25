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
    validates :user_id, :long_url, presence: true, uniqueness: true 
    validates :short_url
end
