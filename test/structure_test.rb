require './bin/structure'
require 'minitest/autorun'
require 'minitest/pride'

class StructureTest < Minitest::Test

  def test_it_creates_folders
    folder = Structure.new('~/HydeTest')
    assert File.directory?('~/HydeTest')
  end

end
