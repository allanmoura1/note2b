class UploadController < ApplicationController
	def index
		@photo = Photo.new
	end	

	def create
		@photo = Photo.new(photo_params)
		if @photo.save
			redirect_to action: "show", id: @photo.id, notice: t('flash.notice.upload_sucess')
		else
			render 'index'
		end
	end

	def show
		@photo = Photo.find(params[:id])
	end

	private

	def photo_params
		params.require(:photo).permit(:image,:uid)
	end
end