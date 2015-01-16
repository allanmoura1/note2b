class Photo < ActiveRecord::Base
	dragonfly_accessor :image
	#validates_presence_of :image
	#validates_property :format, of: :image, in: ['jpeg', 'png']
	#validates_size_of :image, maximum: 2048.kilobytes

end
