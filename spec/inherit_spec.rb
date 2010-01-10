
require File.join(File.dirname(__FILE__), 'spec_helper.rb')

require 'parsedate'

describe HashPath do
  def data
    {
      "calendar" => {
        "start" => "2010/01/10 23:30",
        "stop"  => "2010/01/10 23:56",
      }
    }
  end

  class Event < HashPath
    path :st, "calendar/start"
    path :en, "calendar/stop"

    def st
      to_time(super)
    end

    private
      def to_time(string)
        array = ParseDate.parsedate(string)
        Time.mktime(*array[0,6])
      end
  end

  subject { Event.new(data) }
  its(:st) { should == Time.mktime(2010, 1, 10, 23, 30) }
  its(:en) { should == "2010/01/10 23:56" }
end
