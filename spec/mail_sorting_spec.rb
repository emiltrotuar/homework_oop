require 'spec_helper'
require_relative '../mail_sorting'

describe MailSorting do
	before :all do
		city = ['Hill Valley','Hogsmeade','Pleasantville','Gotham','Springfield'].each
		street = ['Main St','Paper St.','Willow St', 'Elm St','Oak St'].each
		house = [1,2,3,4,5].each
		apartment = [1,2,3,4,5].each
		destination = ['Bob','Mary','Steve','Jill','Frank'].each
		value = [0,5,10,15,20].each
		params = [city,street,house,apartment,destination,value]
		parcels=[]

		5.downto 1 do |n|
			n.times do
				parcels << Parcel.new(city.next, street.next, house.next, apartment.next, destination.next, value.next)
			end
			params.map! {|i| i.rewind}
		end

		@ms = MailSorting.new parcels
	end

	it 'should raise error in case of wrong input' do
		expect do
			Parcel.new 'Hill Valley', 'Main St', '1st', 1, 'Bob', 0
		end.to raise_error RuntimeError
	end

	it 'should get an array as an argument' do
		@ms.parcels.class.should eq Array
	end

	it 'should count number of parcels sent to some city' do
		@ms.num_parc_sent_to_some_city('Pleasantville').should eq 3
	end

	it 'should count number of parcels with value higher than 10 were sent' do
		@ms.num_parc_val_more_th_ten.should eq 3
	end

	it 'should find out what is the most popular address' do
		@ms.most_popular_address.should eq "Hill Valley, Main St, 1, ap. 1, to: Bob"
	end
end