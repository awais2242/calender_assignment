# frozen_string_literal: true

require_relative '../working'
require 'rspec'

RSpec.describe Calendar do
  let(:calendar) { Calendar.new }

  describe '#add_event' do
    it 'adds an event to the calendar' do
      date = '2024-07-20'.chomp
      event_name = 'Meeting with CEO'
      expect { calendar.add_event(date, event_name) }.to output("Event 'Meeting with CEO' added on 2024-July-20.\n").to_stdout
      events = calendar.events_on_specific_date(date)
      expect(events).to include(event_name)
    end
  end

  describe '#remove_event' do
    it 'removes an event from the calendar' do
      date = '2024-07-20'
      event_name = 'Meeting with CEO'
      calendar.add_event(date, event_name)
      expect { calendar.remove_event(date, event_name) }.to output("Event 'Meeting with CEO' deleted successfully!\n").to_stdout
      events = calendar.calendar_hash[2024]['July'][20]
      expect(events).not_to include(event_name)
    end
  end
end
RSpec.describe Calendar do
  describe '#edit_event' do
    it 'edits an existing event in the calendar' do
      calendar = Calendar.new
      date = '2024-07-20'
      old_event_name = 'Meeting with CEO'
      new_event_name = 'Updated Meeting with CEO'
      calendar.add_event(date, old_event_name)
      expect { calendar.edit_event(date, old_event_name, new_event_name) }.to output.to_stdout
      events = calendar.events_on_specific_date(date)
      expect(events).not_to include(old_event_name)
      expect(events).to include(new_event_name)
    end
  end

  describe '#events_on_specific_date' do
    it 'prints events on a specific date' do
      calendar = Calendar.new
      date = '2024-07-20'
      event_name = 'Meeting with CEO'
      calendar.add_event(date, event_name)
      expect { calendar.events_on_specific_date(date) }.to output(/#{event_name}/).to_stdout
    end
  end
end
