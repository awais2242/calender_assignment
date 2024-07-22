# frozen_string_literal: true

require 'rainbow/refinement'
require_relative 'working'
require_relative 'modules'
require_relative 'exception_handling'
using Rainbow
c1 = Calendar.new

def false_date_input(date)
  flag = UserInputValidation.check_date_format?(date)
  while flag == false
    puts 'Input Date in Correct Format!!'
    date = gets.chomp
    flag = UserInputValidation.check_date_format?(date)
  end
  date
end

def false_event_input(event_name)
  flag = UserInputValidation.empty_event?(event_name)
  while flag == false
    puts 'Event Name cannot be left empty.'
    event_name = gets.chomp
    flag = UserInputValidation.empty_event?(event_name)
  end
  event_name
end

puts 'Calendar Application'.center(100).green

exit_flag = false

while exit_flag == false
  puts '1. Add Event'.yellow
  puts '2. Remove Event'.yellow
  puts '3. Edit Event'.yellow
  puts '4. Print Events on Date'.yellow
  puts '5. Print Events in Month'.yellow
  puts '6. Print Month View'.yellow
  puts '7. Exit'.red
  print 'Choose an option: '.yellow
  option = gets.chomp

  begin
    case option.to_i
    when 1
      ErrorHandler.handle_add_event_error do
        puts 'Enter date on which you want to add event. (YYYY-MM-D)'
        date = gets.chomp
        date = false_date_input(date)
        puts 'Enter Event Name'
        event_name = gets.chomp
        event_name = false_event_input(event_name)
        c1.add_event(date, event_name)
      end

    when 2
      ErrorHandler.handle_remove_event_error do
        puts 'Enter date on which you want to remove event. (YYYY-MM-D)'
        date = gets.chomp
        date = false_date_input(date)
        puts 'Enter Event Name which you want to remove'
        event_name = gets.chomp
        event_name = false_event_input(event_name)
        c1.remove_event(date, event_name)
      end

    when 3
      ErrorHandler.handle_edit_event_error do
        puts 'Enter date on which you want to edit event. (YYYY-MM-D)'
        date = gets.chomp
        date = false_date_input(date)
        puts 'Enter Old Event Name which you want to edit'
        old_event_name = gets.chomp
        old_event_name = false_event_input(old_event_name)
        puts 'Enter New Event Name which you want to add'
        new_event_name = gets.chomp
        new_event_name = false_event_input(new_event_name)
        c1.edit_event(date, old_event_name, new_event_name)
      end

    when 4
      ErrorHandler.handle_view_event_error do
        puts 'Enter date on which you want to see event. (YYYY-MM-D)'
        date = gets.chomp
        date = false_date_input(date)
        c1.events_on_specific_date(date)
      end

    when 5
      ErrorHandler.handle_print_month_event_error do
        puts 'Enter Only Month and Year'
        date = gets.chomp
        date << '-1'
        date = false_date_input(date)
        c1.print_month_event_detail(date)
      end

    when 6
      ErrorHandler.handle_print_month_view_error do
        puts 'Enter Only Month and Year'
        date = gets.chomp
        date << '-1'
        date = false_date_input(date)
        c1.month_view(date)
      end

    when 7
      puts '...EXITING...'.center(100).red
      exit_flag = true

    else
      puts 'Invalid option. Please choose a valid option.'
    end
  rescue StandardError => e
    puts "An unexpected error occurred: #{e.message}"
  end
end
