require "spec_helper"

RSpec.describe Veeqo::Company do
  describe ".find" do
    it "retrieves the current company" do
      stub_veeqo_company_find_api
      company = Veeqo::Company.find

      expect(company.name).not_to be_nil
    end
  end
end
