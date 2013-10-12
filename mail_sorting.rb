class Parcel 
	attr_accessor :city, :street, :house, :apartment, :destination, :value
	def initialize city, street, house, apartment, destination, value
		@city 			 = city if city.is_a? String
		@street 		 = street if street.is_a? String
		@house 			 = house if house.is_a? Fixnum
		@apartment 	 = apartment if apartment.is_a? Fixnum
		@destination = destination if destination.is_a? String
		@value 			 = value if value.is_a? Fixnum
		raise 'you should check your input' if instance_variables.compact.count < 6
	end

	def inspect
		"#{@city}, #{@street}, #{@house}, ap. #{@apartment}, to: #{@destination}"
	end
end

class MailSorting
	attr_accessor :parcels
	
	def initialize parcels
 		raise ArgumentError, 'Input is not an array' unless parcels.is_a? Array
		parcels.select! {|p| p.is_a? Parcel}
		@parcels = parcels
	end

	def num_parc_sent_to_some_city city
		@parcels.select do |i|
			i.city == city
		end.count
	end

	def num_parc_val_more_th_ten
		@parcels.select do |i|
			i.value>10
		end.count
	end

	def most_popular_address
		@parcels.group_by{|a| a }.values.max_by(&:size).first.inspect
	end
end