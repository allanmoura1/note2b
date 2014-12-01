#Controle de sessão
class UserSessionsController < ApplicationController
	#Intancia um novo objeto UserSession
	def new
		@user_session = UserSession.new(session)
	end
	#Tenta autenticar com os dados informados no formulário, redirecionado em caso de sucesso e informando via flash
	def create
		@user_session = UserSession.new(session, params[:user_session])
		if @user_session.authenticate!
			redirect_to root_path, notice: t('flash.notice.signed_in')
		else
			render :new
		end
	end
	#Destroi a sessão e informa via flash
	def destroy
		user_session.destroy
		redirect_to root_path, notice: t('flash.notice.signed_out')
	end
end