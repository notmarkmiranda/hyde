require 'date'
require 'fileutils'
require 'pry'

class OutputStructure
  attr_accessor :path

  def initialize(path)
    @structure = Structure.new
    # create_outer_structure(path)
    # create_inner_structure
    # create_writeable_files

  end

  def create_output_structure(path)
    structure.create_outer_structure(path)
    structure.create_inner_structure
  end

  def create_inner_structure
    FileUtils::mkdir_p @home + '/_output'
    FileUtils::mkdir_p @home + '/source/css'
    FileUtils::mkdir_p @home + '/source/pages'
    FileUtils::mkdir_p @home + '/source/posts'
  end

  def create_writeable_files
    placeholder_text = "This is placeholder text."
    date = Date.today.strftime("%Y-%m-%d")
    File.write(@home + '/source/css/main.css', placeholder_text)
    File.write(@home + '/source/pages/about.md', placeholder_text)
    File.write(@home + '/source/index.md', placeholder_text)
    File.write(@home + '/source/posts/' + date + '-welcome-to-hyde.md', placeholder_text)
  end

end
