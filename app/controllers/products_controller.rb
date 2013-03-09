class ProductsController < ApplicationController
  # GET /products
  # GET /products.json

  # The index method will help show a segment of each category on the page.
  # It will do this by creating a hash that includes each variable needed for
  # the page. The has will be separated by boolean which will decided if the
  # the page is an index page or a category view.

  # Assumption: There will always be a category. If category is not set then
  # we are in the index page

  def index

    @isMainIndex = false

    #Create a hash for all the display subdivision
    @display = Hash.new

    #Returns the parameters (if any) set by the user
    @page, @productsPerPage, @category = init()

    @catProductsPerPage = 6

    #The amount of products to be displayed width wise
    @displayWidth = 4

    # If category is set to all by the init (Category not set) then we can assume
    # We are in the main page and create a hash with the different categories
    # to display.
    if @category.id == Category.find(1).id
       @display = getMainHash(@page, @productsPerPage, @displayWidth, Category.find_all_by_depth(1))
       @isMainIndex = true
    else
      @categories, @products, @totalProducts, @totalPages, @displayHeight =
          getCategoryPage(@page, @catProductsPerPage , @displayWidth, @category)

    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private

  #Grabs the parameters set by the user
  def init(_defaultPage = 1, _defaultPPP = 3, _defaultCat = 1)
    _page = params[:page_num]
    _page ? _page = Integer(_page) : _page = _defaultPage
    _ppp = params[:per_page]
    _ppp ? _ppp = Integer(_ppp) : _ppp = _defaultPPP
    _cat = params[:cat]
    _cat ? _cat = Category.find(Integer(_cat)) : _cat = Category.find(_defaultCat)
    return _page, _ppp, _cat
  end

  def getCategoryPage(_page, _productsPerPage, _displayWidth, _category)
    #Returns all the subcategories associated with that category
    _categories = Category.getCategories(_category)

    #Return all the products based on page, products per page, and category
    _products, _totalProducts = Product.getProducts(_page, _productsPerPage, _category)

    _totalPages = (_totalProducts / _productsPerPage.to_f).ceil

    _displayHeight = (_products.length / _displayWidth.to_f).ceil

    return _categories, _products, _totalProducts, _totalPages, _displayHeight
  end

  # Returns a hash with the category as the key and an (array or hash)? with
  # all the values
  def getMainHash(_page, _productsPerPage, _displayWidth, _categories)
    _displayHash = Hash.new

    _categories.each do |i|
      _variableHash = Hash.new

      _variableHash[:categories] = Category.getCategories(i)
      _variableHash[:products] , _variableHash[:totalProducts] =
          Product.getProducts(_page, _productsPerPage, i)
      _variableHash[:totalPages] =
          (_variableHash[:totalProducts] / _productsPerPage.to_f).ceil
      _variableHash[:displayHeight] =
          (_variableHash[:products].length / _displayWidth.to_f).ceil

      _displayHash[i] = _variableHash

    end

    return _displayHash
  end

end
