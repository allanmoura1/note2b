class User < ActiveRecord::Base
	EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
	validates_presence_of :email, :full_name, :cpf, :password
	validates_uniqueness_of :cpf

	validate :email_format

	has_secure_password

	def self.authenticate(cpf, password)
		user = User.find_by(cpf: cpf)
		if user.present?
			user.authenticate(password)
		end
	end
	private
	def email_format
		errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
	end
end
