module CarsHelper	
	def image_for(car)
	  if car.image_file_name.blank?
	    image_tag('placeholder.png')
	  else
	    image_tag(car.image_file_name)
	  end
	end
end
