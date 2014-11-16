class User < ActiveRecord::Base
	EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
	validates_presence_of :email, :full_name, :cpf, :password
	validates_confirmation_of :password
	validates_uniqueness_of :cpf

	validate :email_format

	private
	def email_format
		errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
	end
end
