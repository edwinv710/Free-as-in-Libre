require 'spec_helper'

describe "product_displays/new" do
  before(:each) do
    assign(:product_display, stub_model(ProductDisplay).as_new_record)
  end

  it "renders new product_display form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", product_displays_path, "post" do
    end
  end
end
