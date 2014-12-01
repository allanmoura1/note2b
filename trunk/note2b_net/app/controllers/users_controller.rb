#Classe de controle para usuários do sistema
class UsersController < ApplicationController
	before_action :can_change, only: [:edit, :update]
	before_action :require_no_authentication, only: [:new, :create]

	#Instancia um novo objeto User
	def new
		@user = User.new
	end

	#Tenta criar um novo usuário com os dados do formulário, e informa via flash, 
	#em caso de falha renderiza uma nova pagina new com os dados digitados preservados
	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to @user, 
			notice: 'Usuário criado com sucesso!'
		else
			render action: :new
		end
	end

	#Atualização dos dados pega o id dos parametros da URL
	#Em caso de sucesso redireciona para a view de show e informa no flash
	#Caso haja alguma falha renderiza novamente a pagina edit com os valores do formulario sendo preservados
	def update
			@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to @user, 
			notice: 'Usuário atualizado com sucesso!'
		else
			render action: :edit
		end
	end
	#Informa os dados do id no parâmetro
	def show
		@user = User.find(params[:id])
	end
	#Edita os dados do usuário informado no parametro
	def edit
		@user = User.find(params[:id])
	end

	private
	def user_params
		params.require(:user).permit(:full_name, :email, :cpf, :password, :password_confirmation)
	end

	def can_change
		unless user_signed_in? && current_user == user
			redirect_to user_path(params[:id])
		end
	end

	def user
		@user ||= User.find(params[:id])
	end
end