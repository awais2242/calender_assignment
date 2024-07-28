require 'rainbow/refinement'
require_relative '../Modules/modules'
require_relative './calendar_class'
require_relative '../exceptions/exception'
using Rainbow


class Cases < Calendar

  @calendar_object=Calendar.new

  def self.add_event
    puts 'Enter date on which you want to add event. (YYYY-MM-D)'
    date = gets.chomp
    date = ErrorHandling.date_validation(date)
    puts "ass #{date}"
    puts 'Enter Event Name'
    event_name = gets.chomp
    event_name = ErrorHandling.event_validation(event_name)
    @calendar_object.add_event(date, event_name)
  end

  def self.remove_event
     puts 'Enter date on which you want to7remove event. (YYYY-MM-D)'
        date = gets.chomp
        date = ErrorHandling.date_validation(date)
        puts 'Enter Event Name which you want to remove'
        event_name = gets.chomp
        event_name = ErrorHandling.event_validation(event_name)
        @calendar_object.remove_event(date, event_name)
  end

  def self.edit_event
    puts 'Enter date on which you want to edit event. (YYYY-MM-D)'
        date = gets.chomp
        date = ErrorHandling.date_validation(date)
        puts 'Enter Old Event Name which you want to edit'
        old_event_name = gets.chomp
        old_event_name=ErrorHandling.event_validation(old_event_name)
        puts 'Enter New Event Name which you want to add'
        new_event_name = gets.chomp
        new_event_name=ErrorHandling.event_validation(new_event_name)
        @calendar_object.edit_event(date, old_event_name, new_event_name)
  end

  def self.print_event
    puts 'Enter date on which you want to see event. (YYYY-MM-D)'
    date = gets.chomp
    date = ErrorHandling.date_validation(date)
    @calendar_object.events_on_specific_date(date)
  end

  def self.print_events_in_month
    puts 'Enter Only Month and Year ( YYYY-MM ) '
        date = gets.chomp
        date << '-1'
        while  UserInputValidation.check_date_format?(date) == false
          puts 'Input Date in Correct Format!!'
          date = gets.chomp
          date << '-1'
        end
        @calendar_object.print_month_event_detail(date)
  end

  def self.month_view
    puts 'Enter Only Month and Year  ( YYYY-MM ) '
        date = gets.chomp
        date << '-1'
        while UserInputValidation.check_date_format?(date) == false
          puts 'Input Date in Correct Format!!'
          date = gets.chomp
          date << '-1'
        end
        @calendar_object.month_view(date)
  end
end