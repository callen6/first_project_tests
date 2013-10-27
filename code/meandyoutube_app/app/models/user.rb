class User < ActiveRecord::Base
	def self.from_omniauth(auth_hash)
		where(auth_hash.slice("provider", "uid")).first || create_from_omniauth(auth_hash)
	end

	def self.create_from_omniauth(auth_hash)
		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.name = auth["info"]["name"]
			user.email = auth["info"]["email"]
			user.image = auth["info"]["image"]
			user.first_name = auth["info"]["first_name"]
			user.token = auth["credentials"]["token"]
			user.refresh_token = auth["credentials"]["refresh_token"]
			user.expires_at = auth["credentials"]["expires_at"]
	end
end