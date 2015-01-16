#Classe ainda em implementação TODO
class Bill < ActiveRecord::Base
	def self.search(search)
		results = Bill.where("numero_documento like ? or notes like ? ","%#{search}%", "%#{search}%")
		##results << Bill.where("notes like ?", "%#{search}%")
	end
end
