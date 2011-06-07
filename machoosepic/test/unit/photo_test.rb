require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  test "win rating calculations with largest k" do
    photo1 = Photo.new(:href => "notnull", :rating => 1400, :match_count => 20)
    assert_equal(photo1.set_new_calculated_rating(1, 1400), 1413)

    photo2 = Photo.new(:href => "notnull", :rating => 1603, :match_count => 20)
    assert_equal(photo2.set_new_calculated_rating(1, 1700), 1619)
  end
  test "loss rating calculations with largest k" do
    photo1 = Photo.new(:href => "notnull", :rating => 1400, :match_count => 20)
    assert_equal(photo1.set_new_calculated_rating(0, 1400), 1388)

    photo2 = Photo.new(:href => "notnull", :rating => 1603, :match_count => 20)
    assert_equal(photo2.set_new_calculated_rating(0, 1700), 1594)
  end

  test "win rating calculations with middle k" do
    photo1 = Photo.new(:href => "notnull", :rating => 1400, :match_count => 30)
    assert_equal photo1.set_new_calculated_rating(1, 1400), 1408
  end
  test "loss rating calculations with middle k" do
    photo1 = Photo.new(:href => "notnull", :rating => 1400, :match_count => 30)
    assert_equal photo1.set_new_calculated_rating(0, 1400), 1393
  end

  test "win rating calculations with smallest k" do
    photo1 = Photo.new(:href => "notnull", :rating => 2400, :match_count => 30)
    assert_equal photo1.set_new_calculated_rating(1, 2400), 2405
  end
  test "loss rating calculations with smallest k" do
    photo1 = Photo.new(:href => "notnull", :rating => 2400, :match_count => 30)
    assert_equal photo1.set_new_calculated_rating(0, 2400), 2395
  end

end


