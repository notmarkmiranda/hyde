require'./bin/structure'
require 'minitest/autorun'
require 'minitest/pride'

class StructureTest < Minitest::Test

  def test_it_creates_folders
    folder = Structure.new(Dir.home + '/HydeTest')
    assert File.directory?(Dir.home + '/HydeTest')
  end

  def test_it_creates_subfolders_in_the_directory
    Structure.new(Dir.home + '/HydeTest/source/css')
    assert File.directory? (Dir.home + 'HydeTest/source/css')
  end

end
