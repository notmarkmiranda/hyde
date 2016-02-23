require 'pry'
require 'FileUtils'

class Structure
  attr_accessor :path

  def initialize(path)
    create_outer_structure(path)
    create_inner_structure
    create_writeable_files
  end

  def create_outer_structure(path)
    @home = Dir.home + path
    FileUtils::mkdir_p @home
  end

  def create_inner_structure
    FileUtils::mkdir_p @home + '/_output'
    FileUtils::mkdir_p @home + '/source/css'
    FileUtils::mkdir_p @home + '/source/pages'
    FileUtils::mkdir_p @home + '/source/posts'
  end

  def create_writeable_files
    placeholder_text = "This is placeholder text."
    File.write(@home + '/source/css/main.css', placeholder_text)
    File.write(@home + '/source/pages/about.md', placeholder_text)
    File.write(@home + '/source/index.md', placeholder_text)
    File.write(@home + '/source/posts/welcome-to-hyde.md', placeholder_text)
  end

end
