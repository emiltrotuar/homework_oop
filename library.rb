# require 'pry'
require 'date'

class BookOrder
	attr_reader :reader, :book, :order_date, :issue_date
	def initialize reader, book, order_date, issue_date
		@reader     = reader
		@book       = book
		@order_date = order_date
		@issue_date = issue_date
	end
end

class Library
	attr_reader :book_orders
	def initialize book_orders=[BookOrder.new('Reader','Book',Date.today,Date.today+1)]
 		raise ArgumentError, 'Input is not an array' unless book_orders.is_a? Array
		book_orders.select! {|bo| bo.is_a? BookOrder}
		@book_orders = book_orders
	end
	def smallest_period
		@book_orders.map do |bo|
		  (bo.issue_date - bo.order_date).to_i if bo.issue_date
		end.compact.min
	end
	def not_satisfied_orders
		@book_orders.select do |bo|
			!bo.issue_date
		end.count
	end
	def most_active_reader
		@book_orders.map do |bo|
		  bo.reader
		end.group_by{|a| a }.values.max_by(&:size).first
	end
	def most_popular_book
		@book_orders.map do	|bo|
			bo.book
		end.group_by{|a| a }.values.max_by(&:size).first
	end
	def people_ordered_most_popular_book
		@book_orders.select do |bo|
			bo.reader if bo.book == most_popular_book
		end.count
	end
end

# a = Library.new

# binding.pry