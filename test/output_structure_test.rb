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
    FileUtils.rm_rf(Dir.home + '/Hyde_output')
  end

  def test_it_copies_files_to_output_folder
    folder = Structure.new('/HydeTest')
    folder_two = OutputStructure.new('/HydeTest')
    assert File.file?(Dir.home + '/HydeTest/_output/css/main.css')
    FileUtils.rm_rf(Dir.home + '/Hydetest')
  end

  def test_it_can_convert_html_files
    folder = Structure.new('/HydeTest')
    folder_two = OutputStructure.new('/HydeTest')
    assert File.file?(Dir.home + '/HydeTest/_output/index.html')
    FileUtils.rm_rf(Dir.home + '/Hydetest')
  end

  def test_it_can_convert_pages_html_files
    folder = Structure.new('/HydeTest')
    folder_two = OutputStructure.new('/HydeTest')
    assert File.file?(Dir.home + '/HydeTest/_output/pages/about.html')
    FileUtils.rm_rf(Dir.home + '/Hydetest')
  end

  def test_it_can_convert_pages_html_files
    folder = Structure.new('/HydeTest')
    folder_two = OutputStructure.new('/HydeTest')
    date = Date.today.strftime("%Y-%m-%d")
    assert File.file?(Dir.home + '/Hydetest/_output/posts/' + date + '-welcome-to-hyde.html')
    FileUtils.rm_rf(Dir.home + '/Hydetest')
  end



end
