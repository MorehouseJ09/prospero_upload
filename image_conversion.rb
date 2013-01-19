# this module is responsible for the conversion of images based on an input directory.
# will recursively find all of the images inside of it and will then move forward and resize / reposition all of those

require 'pathname'
require 'RMagick'


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

			@images = self.get_images directory

			# rename_images
			convert_images

		end

		def get_images(directory) 

			# responsible for grabbing the images and parsing to ensure that they are only of the proepr types
			all_images = self.class.get_files directory

			images = Array.new

			# now grab only the valid images
			all_images.each do |file|

				extension = file.split(".")[-1]

				images << file if @@image_extensions.include? extension

			end

			return images
		end

		def rename_images

			counter = 0
			new_images = Array.new

			@images.each do |file|


				name = File.join Pathname.new(file).dirname, "#{counter}.png"
				File.rename file, name

				# 
				new_images << name
				counter += 1

			end

			@images = new_images

		end

		def convert_images 

			@images.each do |file|

				temp = Magick::Image.read(file).first
				temp.format = "PNG"
				temp.resize_to_fill(1200, 1200)
				temp.write "#{file}_new"

				puts "#{file} converted"

			end

		end
	end

end


Image_conversion.class #=> Test
Image_conversion.constants #=> [:test]
Image_conversion.instance_methods #=> [:tst]
