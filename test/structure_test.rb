require './test/test_helper'
require './lib/structure'

class StructureTest < Minitest::Test

  def test_it_creates_outer_folders
    folder = Structure.new('/HydeTest')
    assert File.directory?('./lib/Hydetest')
    FileUtils.rm_rf('./lib/Hydetest')
  end

  def test_it_creates_inner_folder_structure
    folder = Structure.new('/Hydetest')
    assert File.directory?('./lib/Hydetest/source/css')
    assert File.directory?('./lib/Hydetest/source/pages')
    assert File.directory?('./lib/Hydetest/source/posts')
    FileUtils.rm_rf('./lib/Hydetest')
  end

  def test_it_creates_writeable_files
    folder = Structure.new('/Hydetest')
    date = Date.today.strftime("%Y-%m-%d")
    assert File.file?('./lib/Hydetest/source/css/main.css')
    assert File.file?('./lib/Hydetest/source/pages/about.md')
    assert File.file?('./lib/Hydetest/source/index.md')
    assert File.file?('./lib/Hydetest/source/posts/' + date + '-welcome-to-hyde.md')
    FileUtils.rm_rf('./lib/Hydetest')
  end

end
