class CategoryController < ApplicationController

  def index
    @categories = Category.find_all_by_depth(0);

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def show

    @categories = getCategories

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

end
