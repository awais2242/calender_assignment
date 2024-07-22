# frozen_string_literal: true

# The ErrorHandler module provides methods to handle various errors
# that might occur within the application. It includes methods for
# logging errors, displaying user-friendly error messages, and
# possibly retrying operations.
module ErrorHandler
  def self.handle_add_event_error
    yield
  rescue StandardError => e
    puts "An error occurred while adding the event: #{e.message}"
  end

  def self.handle_remove_event_error
    yield
  rescue StandardError => e
    puts "An error occurred while removing the event: #{e.message}"
  end

  def self.handle_edit_event_error
    yield
  rescue StandardError => e
    puts "An error occurred while editing the event: #{e.message}"
  end

  def self.handle_view_event_error
    yield
  rescue StandardError => e
    puts "An error occurred while retrieving events: #{e.message}"
  end

  def self.handle_print_month_event_error
    yield
  rescue StandardError => e
    puts "An error occurred while printing events in the month: #{e.message}"
  end

  def self.handle_print_month_view_error
    yield
  rescue StandardError => e
    puts "An error occurred while printing the month view: #{e.message}"
  end
end
