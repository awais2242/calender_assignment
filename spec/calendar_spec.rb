# frozen_string_literal: true

require_relative '../main/calendar_class'
require_relative './test_cases'
require 'rspec'

RSpec.describe Calendar do
  let(:calendar) { Calendar.new }
  let(:date) { '2024-July-20' }
  let(:event_name) { 'Meeting with CEO' }
  let(:new_event_name) { 'Updated Meeting with CEO' }

  describe '#add_event' do
    include_examples 'adding an event'
  end

  describe '#remove_event' do
    include_examples 'removing an event'
  end

  describe '#edit_event' do
    include_examples 'editing an event'
  end

  describe '#events_on_specific_date' do
    include_examples 'printing events on a specific date'
  end
end
