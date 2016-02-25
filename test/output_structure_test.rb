require './test/test_helper'
require './lib/output_structure'

class OutputStructureTest < Minitest::Test

  def test_it_creates_inner_folder_structure_in_output_folder
    folder = Structure.new('/HydeTestOne')
    folder_two = OutputStructure.new('/HydeTestOne')
    assert File.directory?('./lib/HydeTestOne/_output')
    assert File.directory?('./lib/HydeTestOne/_output/css')
    assert File.directory?('./lib/HydeTestOne/_output/pages')
    assert File.directory?('./lib/HydeTestOne/_output/posts')
    FileUtils.rm_rf('./lib/HydeTestOne')
  end

  def test_it_copies_files_to_output_folder
    folder = Structure.new('/HydeTestTwo')
    folder_two = OutputStructure.new('/HydeTestTwo')
    assert File.file?('./lib/HydeTestTwo/_output/css/main.css')
    FileUtils.rm_rf('./lib/HydeTestTwo')
  end

  def test_it_can_convert_html_files
    folder = Structure.new('/HydeTestThree')
    folder_two = OutputStructure.new('/HydeTestThree')
    assert File.file?('./lib/HydeTestThree/_output/index.html')
    FileUtils.rm_rf('./lib/HydeTestThree')
  end

  def test_it_can_convert_pages_html_files
    folder = Structure.new('/HydeTestFour')
    folder_two = OutputStructure.new('/HydeTestFour')
    assert File.file?('./lib/HydeTestFour/_output/pages/about.html')
    FileUtils.rm_rf('./lib/HydeTestFour')
  end

  def test_it_can_convert_post_html_files
    folder = Structure.new('/HydeTestFive')
    folder_two = OutputStructure.new('/HydeTestFive')
    date = Date.today.strftime("%Y-%m-%d")
    assert File.file?('./lib/HydeTestFive/_output/posts/' + date + '-welcome-to-hyde.html')
    FileUtils.rm_rf('./lib/HydeTestFive')
  end



end
