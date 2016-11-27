require 'test_helper'

class NeuronTest < ActiveSupport::TestCase
  describe Neruon do
    it { should validate_presence_of :category }
    it { should validate_presence_of :threshold }
    it { should validate_presence_of :learning_rate }
    it { should validate_presence_of :weights }

    describe "#fired" do
      it "should fire correctly"

    end

    describe "#update_weights" do
      it "should update the weights"

      it "should write to the database"
    end

    describe "#check_weights" do
      it "should record statistics correctly"

    end

    describe "#reset_statistics" do
      it "should reset statistics"
    end
  end
end
