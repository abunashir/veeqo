require "spec_helper"

RSpec.describe Veeqo::Company do
  describe ".find" do
    it "retrieves the current company" do
      stub_veeqo_company_find_api
      company = Veeqo::Company.find

      expect(company.name).not_to be_nil
    end
  end

  describe ".update" do
    it "updates the current company with new attributes" do
      new_attributes = { name: "ACME" }

      stub_veeqo_company_update_api(new_attributes)
      company_update = Veeqo::Company.update(new_attributes)

      expect(company_update.successful?).to be_truthy
    end
  end
end
