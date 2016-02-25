require './lib/error_check'
require './lib/structure'
require './test/test_helper'

class ErrorCheckTest < Minitest::Test
  def test_it_adds_a_slash_if_none_is_given
    path = "blog"
    assert_equal "/blog", ErrorCheck.path_check(path)[-5..-1]
  end

  def test_it_can_define_path_in_home_directory
    path = "~/blog"
    assert_equal "Users", ErrorCheck.path_check(path).split("/")[1]
  end
end
