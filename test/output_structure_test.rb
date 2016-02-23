require './lib/output_structure'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class OutputStructureTest < Minitest::Test

  def test_it_creates_outer_folders
    folder = Structure.new('/Hyde_output')
    assert File.directory?(Dir.home + '/Hyde_output')
  end

  def test_it_creates_inner_folder_structure_in_output_folder
    folder = Structure.new('/Hyde_output')
    assert File.directory?(Dir.home + '/Hyde_output/_output')
    assert File.directory?(Dir.home + '/Hyde_output/_output/css')
    assert File.directory?(Dir.home + '/Hyde_output/_output/pages')
    assert File.directory?(Dir.home + '/Hyde_output/_output/posts')
  end

  def test_it_converts_md_files_in_HTML_files
    skip
    folder = Structure.new('/Hyde_output')
    date = Date.today.strftime("%Y-%m-%d")
    assert File.file?(Dir.home + '/Hyde_output/_output/css/main.css')
    assert File.file?(Dir.home + '/Hyde_output/_output/pages/about.html')
    assert File.file?(Dir.home + '/Hyde_output/_output/index.html')
    assert File.file?(Dir.home + '/Hyde_output/_output/posts/' + date + '-welcome-to-hyde.html')
  end

end
