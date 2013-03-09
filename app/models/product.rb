class Product < ActiveRecord::Base

  has_many :categorizations
  has_many :categories, :through => :categorizations

  #Returns all the products to be displayed based on _page, _productsPerPage
    # and _category

  #Parameters:
    #_page - Page the user is currently on
      #default: 1
    #_productsPerPage: Amount of products to be displayed per page
      #default: 8
    #_category: Category that needs to be displayed
      #default: nil
  def self.getProducts(_page = 1, _productsPerPage = 8, _category = nil)

    @products = Array.new
    @totalProducts = 0

    if (_category) && (_category.depth != 0)
     @categorization = Categorization.find_all_by_category_id(_category.id)

     @categorization.each do |i|
      @products << Product.find(i.product_id)
     end

     @totalProducts = @products.length

     if _page
       offset =  (_page - 1) * 3
       @products = @products.from(offset).first(_productsPerPage)
     else
       @products = @products.first(_productsPerPage)
     end
    else
      @totalProducts = Product.all.length
      if _page
        @products = Product.offset((_page - 1) * _productsPerPage).limit(_productsPerPage).all
      else
        @products = Product.limit(_productsPerPage).all
      end
    end

    return @products, @totalProducts
  end

end
