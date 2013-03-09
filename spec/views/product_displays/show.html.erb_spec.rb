require 'spec_helper'

describe "product_displays/show" do
  before(:each) do
    @product_display = assign(:product_display, stub_model(ProductDisplay))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
