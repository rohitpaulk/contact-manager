require 'digest/md5'

class Contact < ActiveRecord::Base
	validates :name, presence: true
	validates_format_of :email, :with => /@/, :allow_blank => true

	def avatar_url
		hash = Digest::MD5.hexdigest(email.downcase)
		"https://www.gravatar.com/avatar/#{hash}"
	end
end
