# frozen_string_literal: true

require 'date'
require_relative 'modules'
require 'rainbow/refinement'
using Rainbow

# This class is used to make Calendar to which we can add,delete,edit and remove event
class Calendar
  include Parsedate
  def initialize
    @calendar_hash = Hash.new { |hash, key| hash[key] = Hash.new { |has, ke| has[ke] = Hash.new { |h, k| h[k] = [] } } }
  end

  def adding_event_with_error(date, event_name, month_name)
    @calendar_hash[date.year][month_name][date.day] << event_name
    puts "Event '#{event_name}' added on #{date.year}-#{month_name}-#{date.day}."
  end

  def adding_event_without_error(date, event_name, month_name)
    if @calendar_hash[date.year][month_name][date.day].include?(event_name)
      puts "Event '#{event_name}' already exists on #{date.year}-#{month_name}-#{date.day}."
    else
      adding_event_with_error(date, event_name, month_name)
    end
  end

  def add_event(date, event_name)
    date = parse_date(date)
    month_name = date.strftime('%B')

    adding_event_without_error(date, event_name, month_name)
  end

  def remove_event(date, event_name)
    date = parse_date(date)
    month_name = date.strftime('%B')
    if @calendar_hash[date.year][month_name][date.day].delete(event_name)
      puts "Event '#{event_name}' deleted successfully!"
    else
      puts "Event '#{event_name}' not found on #{date.year}-#{month_name}-#{date.day}."
    end
  end

  def edit_exist_event(date,old_event_name,new_event_name)
    @calendar_hash[date.year][month_name][date.day].map! do |event|
      event == old_event_name ? new_event_name : event
      puts "Event '#{old_event_name}' updated to '#{new_event_name}' on #{date.year}-#{month_name}-#{date.day}."
    end
  end

  def edit_event(date, old_event_name, new_event_name)
    date = parse_date(date)
    month_name = date.strftime('%B')
    events = @calendar_hash[date.year][month_name][date.day]

    if events.include?(old_event_name)
      edit_exist_event(date, old_event_name, new_event_name)
    else
      puts "Event '#{old_event_name}' does not exist on #{date.year}-#{month_name}-#{date.day}."
    end
  end

  def printing_event_on_specific_date(events, date)
    puts "~ Events on #{date.year}-#{date.month}-#{date.day}:"
    events.each { |event| puts "- #{event}" }
  end

  def events_on_specific_date(date)
    date = parse_date(date)
    month_name = date.strftime('%B')
    events = @calendar_hash[date.year][month_name][date.day]

    if events.empty?
      puts "No events on #{date.year}-#{date.month}-#{date.day}."
    else
      printing_event_on_specific_date(events, date)
    end
  end

  def print_month_event_detail(date)
    date = parse_date(date)
    month_name = date.strftime('%B')
    result = @calendar_hash[date.year][month_name]
    if result.empty?
      puts "No events in #{month_name} #{date.year}."
    else
      result.each_value do |events|
        printing_event_on_specific_date(events, date)
      end
    end
  end
 
  def printing_month_view(month_name, last_day, date, calendar_days)
    # week_days.each { |day| puts "#{day}" }
    (1..last_day.day).each do |day|
      event_count = @calendar_hash[date.year][month_name][day].size
      day_str = event_count.positive? ? "#{day.to_s.rjust(11)}(#{event_count})".red : day.to_s.rjust(8).green
      calendar_days << day_str
    end
  end

  def find_first_and_last_day_of_month(date)
    first_day = Date.new(date.year, date.month, 1)
    last_day = Date.new(date.year, date.month, -1)
    [first_day, last_day]
  end

  def month_view(date)
    date = parse_date(date)
    first_day, last_day = find_first_and_last_day_of_month(date)
    month_name = date.strftime('%B')
    puts '----------------------------------------------------------------------'.green
    puts "\tSu\t Mo\t Tu\t We\t Th\t Fr\t Sa".blue
    start_index = first_day.wday
    print '   ' * 3
    calendar_days = Array.new(start_index, '   ')
    printing_month_view(month_name, last_day, date, calendar_days)
    calendar_days.each_slice(7) { |week| puts week.join(' ') }
  end
end
