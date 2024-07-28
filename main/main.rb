# frozen_string_literal: true

require 'rainbow/refinement'
require_relative '../exceptions/exception'
require_relative './user_options'
using Rainbow




puts 'Calendar Application'.center(150).green

exit_flag = false

while exit_flag == false
  puts '---------------------------------------------------------------------------------------------------------------'
  puts '1. Add Event'.yellow
  puts '2. Remove Event'.yellow
  puts '3. Edit Event'.yellow
  puts '4. Print Events on Date'.yellow
  puts '5. Print Events in Month'.yellow
  puts '6. Print Month View'.yellow
  puts '7. Exit'.red
  puts '---------------------------------------------------------------------------------------------------------------'
  print 'Choose an option: '.blue
  option = gets.chomp

  begin
    case option.to_i
    when 1
      ErrorHandling.handle_add_event_error do
       Cases.add_event
      end

    when 2
      ErrorHandling.handle_remove_event_error do
       Cases.remove_event
      end

    when 3
      ErrorHandling.handle_edit_event_error do
        Cases.edit_event
      end

    when 4
      ErrorHandling.handle_view_event_error do
       Cases.print_event
      end

    when 5
      ErrorHandling.handle_print_month_event_error do
        Cases.print_events_in_month
      end

    when 6
      ErrorHandling.handle_print_month_view_error do
        Cases.month_view
      end

    when 7
      puts '...EXITING...'.center(100).red
      exit_flag = true

    else
      puts 'Invalid option. Please choose a valid option.'
    end
  end
end
