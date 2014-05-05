require 'spec_helper'

describe Spot do


  it "is valid with a name" do
    spot = Spot.new
    spot.name = "Test Name"
    expect(spot).to be_valid
  end

end
