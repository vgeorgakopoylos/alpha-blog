require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

  def setup
      @category = Category.create(name: "sports")
      @category2 = Category.create(name: "programming")
  end

  test "should show categories lsiting" do
    get categories_path
    assert_template 'categories/index'
    asset_select "a[href=?]",category_path(@category), text: @category.name
    asset_select "a[href=?]",category_path(@category2), text: @category2.name
  end
end
