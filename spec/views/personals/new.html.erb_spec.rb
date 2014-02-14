require 'spec_helper'

describe "personals/new" do
  before(:each) do
    assign(:personal, stub_model(Personal,
      :name => "MyString",
      :address => "MyString",
      :phone_number => 1,
      :age => 1
    ).as_new_record)
  end

  it "renders new personal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", personals_path, "post" do
      assert_select "input#personal_name[name=?]", "personal[name]"
      assert_select "input#personal_address[name=?]", "personal[address]"
      assert_select "input#personal_phone_number[name=?]", "personal[phone_number]"
      assert_select "input#personal_age[name=?]", "personal[age]"
    end
  end
end
