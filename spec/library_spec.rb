require 'spec_helper'
require_relative '../library'

describe Library do
	before :all do
		readers = ['Bob',
							 'Mary',
							 'Steve',
							 'Jill',
							 'Frank',
							 'Martin',
							 'Lisa',
							 'Kevin'].each
		books 	= ['The Hunger Games',
							 'Harry Potter and the Order of the Phoenix',
							 'Twilight',
							 'To Kill a Mockingbird',
							 'Pride and Prejudice',
							 'The Giving Tree',
							 'Breaking Dawn',
							 'Eclipse'].each

		o_date = Date.today

		bo = []

		5.downto 1 do |i|
			i.times do
			 bo << BookOrder.new(readers.next, books.peek, o_date, o_date+i-1)
			end
			readers.rewind;	books.next
		end

	  readers,books = readers.to_a,books.to_a

	  1.upto 3 do |i|
		  bo << BookOrder.new(readers[-i], books[-i], o_date, nil)
		end
		
	  @lib = Library.new bo
	end

	it 'should raise error in case of wrong input' do
		expect do
			BookOrder.new 'Reader', 'Book', nil, Date.today
		end.to raise_error RuntimeError
		expect do
			BookOrder.new 'Reader', 'Book', Date.today, nil
		end.not_to raise_error
	end

	it 'should get an array as an argument' do
		@lib.book_orders.class.should eq Array
	end

	it 'should find out a smallest period for which library found a book' do
		@lib.smallest_period.should eq 0
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

	it 'should count amount of people who ordered one of the three most popular books' do
		@lib.people_ordered_most_popular_book.should eq 5
	end
end