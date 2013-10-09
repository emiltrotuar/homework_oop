require 'spec_helper'
require_relative '../library'

describe Library do
	before(:all) do
		o_date = Date.today
		bo = [BookOrder.new("Bob","The Hunger Games",o_date,o_date+3),
		 		  BookOrder.new("Mary","The Hunger Games",o_date,o_date+3),
				  BookOrder.new("Steve","The Hunger Games",o_date,o_date+3),
					BookOrder.new("Jill","The Hunger Games",o_date,o_date+3),
		 		 	BookOrder.new("Frank","The Hunger Games",o_date,o_date+3),
		 		 	BookOrder.new("Bob","Harry Potter and the Order of the Phoenix",o_date,o_date+2),
				  BookOrder.new("Mary","Harry Potter and the Order of the Phoenix",o_date,o_date+2),
		 		  BookOrder.new("Steve","Harry Potter and the Order of the Phoenix",o_date,o_date+2),
		 		 	BookOrder.new("Jill","Harry Potter and the Order of the Phoenix",o_date,o_date+2),
		 		  BookOrder.new("Bob","Twilight",o_date,o_date+2),
		 		 	BookOrder.new("Mary","Twilight",o_date,o_date+2),
				  BookOrder.new("Steve","Twilight",o_date,o_date+2),
		 		  BookOrder.new("Bob","To Kill a Mockingbird",o_date,o_date+1),
		 		  BookOrder.new("Mary","To Kill a Mockingbird",o_date,o_date+1),
				  BookOrder.new("Bob","Pride and Prejudice",o_date,o_date+1),
				  BookOrder.new("Martin","The Giving Tree ",o_date,nil),
				  BookOrder.new("Lisa","Breaking Dawn",o_date,nil),
				  BookOrder.new("Kevin","Eclipse",o_date,nil)]
	  @lib = Library.new bo
	end

	it 'should find out a smallest period for which library found a book' do
		@lib.smallest_period.should eq 1
	end
	it 'should count how many orders were not satisfied' do
		@lib.not_satisfied_orders.should eq 3
	end
	it 'should find a reader who often takes the book' do
		@lib.most_active_reader.should eq 'Bob'
	end
	it 'should find out what is the most popular book' do
		@lib.most_popular_book.should eq 'The Hunger Games'
	end
	it 'should count amount of people ordered one of the three most popular books' do
		@lib.people_ordered_most_popular_book.should eq 5
	end
end
