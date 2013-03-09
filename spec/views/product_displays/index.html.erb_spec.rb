require 'spec_helper'

describe "product_displays/index" do
  before(:each) do
    assign(:product_displays, [
      stub_model(ProductDisplay),
      stub_model(ProductDisplay)
    ])
  end

  it "renders a list of product_displays" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
