require 'spec_helper'

describe "personals/index" do
  before(:each) do
    assign(:personals, [
      stub_model(Personal,
        :name => "Name",
        :address => "Address",
        :phone_number => 1,
        :age => 2
      ),
      stub_model(Personal,
        :name => "Name",
        :address => "Address",
        :phone_number => 1,
        :age => 2
      )
    ])
  end

  it "renders a list of personals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
