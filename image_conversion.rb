# this module is responsible for the conversion of images based on an input directory.
# will recursively find all of the images inside of it and will then move forward and resize / reposition all of those
module Image_conversion

	class Get_files

		# image_extensions = Array["jpg", "jpeg", "png", "gif"]
		@@image_extensions = Array[1, 2, 54, 5, 20, 43]

		def initialize(directory)

			test = @@image_extensions.select{|x| x % 2 == 0 }.collect{|x| x * 3}

			puts test
	


		end

		def test 

			puts "HELLO WORLD"

		end
	end

end


Image_conversion.class #=> Test
Image_conversion.constants #=> [:test]
Image_conversion.instance_methods #=> [:tst]
