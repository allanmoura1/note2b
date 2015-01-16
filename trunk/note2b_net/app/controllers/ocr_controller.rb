#Controle Provisório para testar a ferramenta de OCR
class OcrController < ApplicationController

	#Chamada da ferramenta de ocr em uma posição específica
	def index
		path = Rails.root + "public/uploads/teste4.jpg"
		imagem = RTesseract::Mixed.new(path,{:lang => 'por', 
			:areas =>[
			{:x=>185, :y=>572, :width=>625, :height=>75	},
			{:x=>1300, :y=>300, :width=>130,:height=>20},
			{:x=>1335, :y=>843, :width=>100,:height=>21}]
		})
		@text = imagem.to_s
		flash[:ocr] = @text
		redirect_to 'http://localhost:3000/bills/2'
	end

	#Chamada da ferramenta de ocr no documento completo
	def index2
		path = Rails.root + "public/uploads/image012.jpg"
		image = RTesseract.new(path, :lang => "por")
		@text = image.to_s
		flash[:ocr] = @text
		redirect_to 'http://localhost:3000/bills/2'
	end

	def full
		@photo = Photo.find(params[:id])
		path = Rails.root + "public/system/dragonfly/development" + @photo.image_uid		
		imagem = RTesseract.new(path, :lang => "por")
		@text = imagem.to_s
		flash[:ocr] = @text
		redirect_to 'http://localhost:3000/bills/3'
	end

	def template
		@photo = Photo.find(params[:id])
		path = Rails.root + "public/system/dragonfly/development" + @photo.image_uid
		nf = RTesseract::Mixed.new(path,{:lang => 'por', 
			:areas =>[
			{:x=>1300, :y=>300, :width=>130,:height=>20}]
		})

		imagem = RTesseract::Mixed.new(path,{:lang => 'por', 
			:areas =>[
			{:x=>185, :y=>572, :width=>625, :height=>75	},
			{:x=>1335, :y=>843, :width=>100,:height=>21}]
		})
		puts imagem.methods.sort.inspect
		image = imagem.to_s
		flash[:nf] = nf.to_s
		flash[:ocr] = image
		redirect_to new_bill_path


	end
end
