require './lib/structure'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class StructureTest < Minitest::Test

  def test_it_creates_outer_folders
    folder = Structure.new('/HydeTest')
    assert File.directory?(Dir.home + '/Hydetest')
    FileUtils.rm_rf(Dir.home + '/Hydetest')
  end

  def test_it_creates_inner_folder_structure
    folder = Structure.new('/Hydetest')
    assert File.directory?(Dir.home + '/Hydetest/source/css')
    assert File.directory?(Dir.home + '/Hydetest/source/pages')
    assert File.directory?(Dir.home + '/Hydetest/source/posts')
    FileUtils.rm_rf(Dir.home + '/Hydetest')
  end

  def test_it_creates_writeable_files
    folder = Structure.new('/Hydetest')
    date = Date.today.strftime("%Y-%m-%d")
    assert File.file?(Dir.home + '/Hydetest/source/css/main.css')
    assert File.file?(Dir.home + '/Hydetest/source/pages/about.md')
    assert File.file?(Dir.home + '/Hydetest/source/index.md')
    assert File.file?(Dir.home + '/Hydetest/source/posts/' + date + '-welcome-to-hyde.md')
    FileUtils.rm_rf(Dir.home + '/Hydetest')
  end

end
