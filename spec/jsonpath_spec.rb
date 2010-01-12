
require File.join(File.dirname(__FILE__), 'spec_helper.rb')

describe HashPath do
  class Group < HashPath
    path :name                , "name"
    path :leader              , "$..members[0]"
    path :middle_school_member, "$..members[?(@['age'] <= 15)]"
  end

  it "should recognize jsonpath syntax when jsonpath is loaded" do
    require 'hash-path/json'

    buono = Group.new(data('group.json'))
    momo  = {"name"=> "momo", "age"=> 17}
    airi  = {"name"=> "airi", "age"=> 15}

    buono.name.should == "Buono"
    buono.leader.should == [momo]
    buono.middle_school_member.should == [airi]

    # remove const to disable 'jsonpath' gem
    Object.instance_eval { remove_const :JsonPath }

    buono.name.should == "Buono"
    buono.leader.should == nil
    buono.middle_school_member.should == nil
  end
end
