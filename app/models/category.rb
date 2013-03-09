class Category < ActiveRecord::Base

  has_many :categorizations
  has_many :products, :through => :categorizations
  belongs_to :category

  #Goes through a category  and creates an array with all subcategories

  def self.getCategories(_category)

    @cat = _category
    @cats = Array.new

    if _category
      @depth = _category.depth
      @cats << _category

      while @cat.depth != 0
        @cat = Category.find(@cat.category_id)
        @cats << @cat
      end
    else
      _allCategory = Category.find(1)
      @cats << _allCategory
    end
    @cats.reverse!
    return @cats
  end

end
