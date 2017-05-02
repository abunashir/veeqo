require "spec_helper"

RSpec.describe Veeqo::Tag do
  describe ".list" do
    it "retrieves the list of tags" do
      stub_veeqo_tag_list_api
      tags = Veeqo::Tag.list

      expect(tags.count).to eq(2)
      expect(tags.first.id).not_to be_nil
      expect(tags.first.name).to eq("Need Stock")
    end
  end
end
