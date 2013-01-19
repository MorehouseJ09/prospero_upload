# this module is responsible for the conversion of images based on an input directory.
# will recursively find all of the images inside of it and will then move forward and resize / reposition all of those

module Image_conversion

	class Get_files


		def self.get_files directory 

			files = Array.new

			Dir.open(directory).each do | file | 

				# don't want to add these!
				next if file == "." || file == ".."

				# add the file to the list if it is a valid file and not a directory!
				files << File.join(directory, file) if File.exist? File.join directory, file and not File.directory? File.join directory, file

				# check if the file is a directory -- if so we want to grab the element and then recursively grab its contents
				files += self.get_files(File.join directory, file) if File.directory? File.join directory, file

			end

			return files

		end

		@@image_extensions = Array["jpg", "jpeg", "png", "gif"]

		def initialize(directory)

			puts self.class.get_files directory




		end




	end

end


Image_conversion.class #=> Test
Image_conversion.constants #=> [:test]
Image_conversion.instance_methods #=> [:tst]
