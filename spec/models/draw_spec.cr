require "../spec_helper"

describe Draw do
  describe ".count_for" do
    it "returns the number of draws based on team and sheet counts" do
      Draw.count_for(4, 2).should eq 2
      Draw.count_for(8, 2).should eq 6
      Draw.count_for(32, 5).should eq 16
    end
  end
end
