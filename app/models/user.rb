class User < ActiveRecord::Base
	validates_presence_of :email, :full_name, :cpf, :password
end
