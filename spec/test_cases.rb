# frozen_string_literal: true

RSpec.shared_examples 'adding an event' do
  it 'adds an event to the calendar' do
    expect { calendar.add_event(date, event_name) }.to output("Event '#{event_name}' added on #{date}.\n").to_stdout
    events = calendar.events_on_specific_date(date)
    expect(events).to include(event_name)
  end
end

RSpec.shared_examples 'removing an event' do
  before do
    calendar.add_event(date, event_name)
  end

  it 'removes an event from the calendar' do
    expect { calendar.remove_event(date, event_name) }.to output("Event '#{event_name}' deleted successfully!\n").to_stdout
    events = calendar.calendar_hash[2024]['July'][20]
    expect(events).not_to include(event_name)
  end
end

RSpec.shared_examples 'editing an event' do
  before do
    calendar.add_event(date, event_name)
  end

  it 'edits an existing event in the calendar' do
    expect { calendar.edit_event(date, event_name, new_event_name) }.to output("Event '#{event_name}' updated to '#{new_event_name}' on #{date}.\n").to_stdout
    events = calendar.events_on_specific_date(date)
    expect(events).not_to include(event_name)
    expect(events).to include(new_event_name)
  end
end

RSpec.shared_examples 'printing events on a specific date' do
  before do
    calendar.add_event(date, event_name)
  end

  it 'prints events on a specific date' do
    expect { calendar.events_on_specific_date(date) }.to output(/#{event_name}/).to_stdout
  end
end
