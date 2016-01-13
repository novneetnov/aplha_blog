class User < ActiveRecord::Base
	has_many :articles
	before_save { self.email = self.email.downcase }
	validates :username, presence: true, 
											 uniqueness: {case_sensitive: false}, 
											 length: {minimum: 3, maximum: 25}

	VALID_EMAIL_REGEX = /\A[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+\z/i
	validates :email, presence: true,
										uniqueness: {case_sensitive: false},
										length: {maximum: 105},
										format: {with: VALID_EMAIL_REGEX}

end
