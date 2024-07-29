# frozen_string_literal: true

require_relative '../Modules/modules'
# The ErrorHandler module provides methods to handle various errors
# that might occur within the application. It includes methods for
# logging errors, displaying user-friendly error messages, and
# possibly retrying operations.

class ErrorHandling < StandardError

  def self.date_validation(date)
    begin
      raise ArgumentError, 'Wrong Input!' unless UserInputValidation.check_date_format?(date)
    rescue ArgumentError
      puts 'Input Date in Correct Format!!'
      date = gets.chomp
      retry
    end
    date
   end

  def self.event_validation(event_name)
    begin
      raise ArgumentError, 'Wrong Input!' unless UserInputValidation.empty_event?(event_name)
    rescue ArgumentError
      puts 'Event Name cannot be left empty.'
      event_name = gets.chomp
      retry
    end
    event_name
  end

  def self.handle_add_event_error
    yield
  rescue ArgumentError => e
    puts "An argument error occurred while adding the event: #{e.message}"
  rescue IOError => e
    puts "An IO error occurred while adding the event: #{e.message}"
  rescue RuntimeError => e
    puts "A runtime error occurred while adding the event: #{e.message}"
  end

  def self.handle_remove_event_error
    yield
  rescue ArgumentError => e
    puts "An argument error occurred while removing the event: #{e.message}"
  rescue IOError => e
    puts "An IO error occurred while removing the event: #{e.message}"
  rescue RuntimeError => e
    puts "A runtime error occurred while removing the event: #{e.message}"
  end

  def self.handle_edit_event_error
    yield
  rescue ArgumentError => e
    puts "An argument error occurred while editing the event: #{e.message}"
  rescue IOError => e
    puts "An IO error occurred while editing the event: #{e.message}"
  rescue RuntimeError => e
    puts "A runtime error occurred while editing the event: #{e.message}"
  end

  def self.handle_view_event_error
    yield
  rescue ArgumentError => e
    puts "An argument error occurred while retrieving events: #{e.message}"
  rescue IOError => e
    puts "An IO error occurred while retrieving events: #{e.message}"
  rescue RuntimeError => e
    puts "A runtime error occurred while retrieving events: #{e.message}"
  end

  def self.handle_print_month_event_error
    yield
  rescue ArgumentError => e
    puts "An argument error occurred while printing events in the month: #{e.message}"
  rescue IOError => e
    puts "An IO error occurred while printing events in the month: #{e.message}"
  rescue RuntimeError => e
    puts "A runtime error occurred while printing events in the month: #{e.message}"
  end

  def self.handle_print_month_view_error
    yield
  rescue ArgumentError => e
    puts "An argument error occurred while printing the month view: #{e.message}"
  rescue IOError => e
    puts "An IO error occurred while printing the month view: #{e.message}"
  rescue RuntimeError => e
    puts "A runtime error occurred while printing the month view: #{e.message}"
  end

end