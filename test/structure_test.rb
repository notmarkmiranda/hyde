require './bin/structure'
require 'minitest/autorun'
require 'minitest/pride'

class StructureTest < Minitest::Test

  def test_it_creates_folders
    folder = Structure.new('/HydeTest/new/file')
    assert File.directory?(Dir.home + '/Hydetest/new/file')
  end

end
