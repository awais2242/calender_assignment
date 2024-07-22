# frozen_string_literal: true

# This module is use to check input enter by user
module UserInputValidation
  def self.check_date_format?(date)
    Date.parse(date)
    true
  rescue ArgumentError
    false
  end

  def self.empty_event?(event_name)
    return false if event_name.nil? || event_name.strip.empty?

    true
  end
end

# This module is used to Parse date string into object
module Parsedate
  def parse_date(date)
    Date.parse(date)
  end
end
