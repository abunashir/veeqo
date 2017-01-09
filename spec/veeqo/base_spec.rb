require "spec_helper"

RSpec.describe Veeqo::Base do
  describe ".method_missing" do
    context "with existing instance method" do
      it "creates a new instace and invoke the method" do
        expect(InheritedBase.valid?).to be_truthy
      end
    end

    context "with non existing instance method" do
      it "raise an default method error" do
        expect { InheritedBase.invalid_method }.to raise_error(NoMethodError)
      end
    end
  end

  class InheritedBase < Veeqo::Base
    def valid?
      true
    end
  end
end
