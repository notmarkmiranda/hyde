require './lib/output_structure'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class OutputStructureTest < Minitest::Test

  def test_it_creates_inner_folder_structure_in_output_folder
    folder = Structure.new('/Hyde_output')
    folder_two = OutputStructure.new('/Hyde_output')
    assert File.directory?(Dir.home + '/Hyde_output/_output')
    assert File.directory?(Dir.home + '/Hyde_output/_output/css')
    assert File.directory?(Dir.home + '/Hyde_output/_output/pages')
    assert File.directory?(Dir.home + '/Hyde_output/_output/posts')
  end

  def test_it_copies_files_to_output_folder
    folder = Structure.new('/HydeTest')
    folder_two = OutputStructure.new('/HydeTest')
    assert File.file?(Dir.home + '/HydeTest/_output/css/main.css')
  end

end
