# frozen_string_literal: true

require_relative 'working'
require 'rspec'

RSpec.describe Calendar do
  let(:calendar) { Calendar.new }

  describe '#add_event' do
    it 'adds an event to the calendar' do
      date = '2023-07-20'
      event_name = 'Meeting with CEO'
      expect { calendar.add_event(date, event_name) }.to output(" Event successfully added! \n").to_stdout
      events = calendar.events_on_specific_date(date)
      expect(events).to include(event_name)
    end
  end

  describe '#remove_event' do
    it 'removes an event from the calendar' do
      date = '2023-07-20'
      event_name = 'Meeting with CEO'
      calendar.add_event(date, event_name)
      expect { calendar.remove_event(date, event_name) }.to output(" Event successfully removed! \n").to_stdout
      events = calendar.events_on_specific_date(date)
      expect(events).not_to include(event_name)
    end
  end

  describe '#edit_event' do
    it 'edits an existing event in the calendar' do
      date = '2023-07-20'
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
      date = '2023-07-20'
      event_name = 'Meeting with CEO'
      calendar.add_event(date, event_name)
      expect { calendar.events_on_specific_date(date) }.to output(/#{event_name}/).to_stdout
    end
  end
end
