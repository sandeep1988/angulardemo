require 'spec_helper'

describe "personals/edit" do
  before(:each) do
    @personal = assign(:personal, stub_model(Personal,
      :name => "MyString",
      :address => "MyString",
      :phone_number => 1,
      :age => 1
    ))
  end

  it "renders the edit personal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", personal_path(@personal), "post" do
      assert_select "input#personal_name[name=?]", "personal[name]"
      assert_select "input#personal_address[name=?]", "personal[address]"
      assert_select "input#personal_phone_number[name=?]", "personal[phone_number]"
      assert_select "input#personal_age[name=?]", "personal[age]"
    end
  end
end
