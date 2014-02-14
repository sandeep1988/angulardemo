require 'spec_helper'

describe "personals/show" do
  before(:each) do
    @personal = assign(:personal, stub_model(Personal,
      :name => "Name",
      :address => "Address",
      :phone_number => 1,
      :age => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Address/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
