#Classe que implementa as validações do usuário do sistema

class User < ActiveRecord::Base
	#Expressão Regular para Emails
	EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
	validates_presence_of :email, :full_name, :cpf, :password
	validates_uniqueness_of :cpf

	validate :email_format


	has_secure_password
	#checa se o cpf existe no banco de dados e então tenta atenticar com password fornecido
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

