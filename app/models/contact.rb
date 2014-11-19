require 'digest/md5'

class Contact < ActiveRecord::Base
	validates :name, presence: true

	def avatar_url
		hash = Digest::MD5.hexdigest(email.downcase)
		"http://www.gravatar.com/avatar/#{hash}"
	end
end
