#Classe para fazer o controle de sessão 
class UserSession
	include ActiveModel::Model
	#Usado como login do sistema
	attr_accessor :cpf
	#Senha digitada pelo usuário
	attr_accessor :password
	validates_presence_of :cpf, :password
	#Inicialização do objeto da sessão
	def initialize(session, attributes={})
		@session = session
		@cpf = attributes[:cpf]
		@password = attributes[:password]
	end
	#Teste para autenticar o usuário, cria uma entrada na hash de erros em caso de usuário invalido
	def authenticate!
		user = User.authenticate(@cpf,@password)

		if user.present?
			store(user)
		else
			errors.add(:base, :invalid_login)
			false
		end
	end
	#Guarda a id do usuário no objeto sessão
	def store(user)
		@session[:user_id] = user.id
	end
	#Memoização do id do usuário para manter em cache essa informação
	def current_user
		User.find(@session[:user_id])
	end
	#Checagem se o usuário já esta logado
	def user_signed_in?
		@session[:user_id].present?
	end
	#Destruição da sessão quando ocorre o logout
	def destroy
		@session[:user_id] = nil
	end

end