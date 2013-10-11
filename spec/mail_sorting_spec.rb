require 'spec_helper'
require_relative '../mail_sorting'

describe MailSorting do
	before :all do
		city = ['Hill Valley','South Park','Hogsmeade','Pleasantville','Gotham','Springfield']
		street = ['Main St.','Paper St.','Willow St', 'Elm St', 'Park lane']
		house = ['1st','2nd','3rd','4th','5th', '6th','7th']
		apartment = [1,2,3,4,5,6,7]
		destination = ['Bob','Mary','Steve','Jill','Frank','Lisa']

		mail_set = [Parcel.new(city, street, house, apartment, destination, value)]
		MailSorting.new
	end

	it 'should' do
		
	end

	it 'should' do
		
	end

	it 'should' do
		
	end
end