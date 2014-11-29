class UserSession
	include ActiveModel::Model

	attr_accessor :cpf, :password
	validates_presence_of :cpf, :password

	def initialize(session, attributes={})
		@session = session
		@cpf = attributes[:cpf]
		@password = attributes[:password]
	end

	def authenticate!
		user = User.authenticate(@cpf,@password)

		if user.present?
			store(user)
		else
			errors.add(:base, :invalid_login)
			false
		end
	end

	def store(user)
		@session[:user_id] = user.id
	end

	def current_user
		User.find(@session[:user_id])
	end

	def user_signed_in?
		@session[:user_id].present?
	end

	def destroy
		@session[:user_id] = nil
	end

end