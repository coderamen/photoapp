require 'test_helper'

class PicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @pic = Pic.new(title: "sports")
  end

  test "title should be valid" do
    assert @pic.valid?
  end

  test "title should be present" do
    @pic.title = " "
    assert @pic.valid?
  end

  test "title should be unique" do
    @pic.save
    pic2 = Pic.new(title: "sports")
    assert_not pic2.valid?
  end

  test "title should not be long" do
    @pic.title = "a" * 26
    assert_not @pic.valid?
  end

  test "title should not be too short" do
    @pic.title = "aa"
    assert_not @pic.valid?
  end
end
