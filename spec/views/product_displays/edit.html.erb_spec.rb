require 'spec_helper'

describe "product_displays/edit" do
  before(:each) do
    @product_display = assign(:product_display, stub_model(ProductDisplay))
  end

  it "renders the edit product_display form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", product_display_path(@product_display), "post" do
    end
  end
end
