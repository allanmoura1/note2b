class OcrController < ApplicationController
	def index
		path = Rails.root + "public/uploads/teste4.jpg"
		imagem = RTesseract::Mixed.new(path,{:lang => 'por', 
		:areas =>[
			{:x=>185, :y=>572, :width=>625, :height=>75	}
		]})
	@text = imagem.to_s
	end	
end