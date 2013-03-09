require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test 'Product has Category' do
    @product = Product.find_by_id(2)

    assert @product.categories
  end


end
