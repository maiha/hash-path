
require File.join(File.dirname(__FILE__), 'spec_helper.rb')

describe HashPath do
  it "should provide .path" do
    HashPath.should respond_to(:path)
  end

  it "should provide #[]" do
    HashPath.new.should respond_to(:[])
  end

  describe "#[]" do
    subject { HashPath.new(data('rails.json')) }

    context "(for present)" do
      its("app/models")     { should == "ActiveRecord" }
      its("vendor/plugins") { should == {"aasm" => "Aasm", "haml" => "Haml"} }
    end

    context "(for missing)" do
      its("foo")     { should == nil }
      its("foo/bar") { should == nil }
    end

    context "(for defined path)" do
      class Labeled < HashPath
        path :model   , "app/models"
        path :nothing , "no/such/value"
      end

      subject { Labeled.new(data('rails.json')) }

      its(:model)           { should == "ActiveRecord" }
      its("model")          { should == "ActiveRecord" }
      its("app/models")     { should == "ActiveRecord" }
      its("vendor/plugins") { should == {"aasm" => "Aasm", "haml" => "Haml"} }
      its(:nothing)         { should == nil }
      its("nothing")        { should == nil }
    end
  end
end
