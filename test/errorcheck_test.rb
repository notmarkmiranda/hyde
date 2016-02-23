require './lib/errorcheck'
require './lib/structure'
require 'minitest/autorun'
require 'minitest/pride'

class ErrorCheckTest < Minitest::Test

  def test_it_can_check_for_errors
    folder = Structure.new('Hydetest')
    assert File.directory?(Dir.home + '/Hydetest')
  end

  def test_it_can_fail_a_folder
    skip
    folder = Structure.new('Hydetest')
    refute folder.errorcheck('path')
  end
end
