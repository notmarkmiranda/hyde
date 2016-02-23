require 'date'
require 'fileutils'
require 'pry'
require './lib/structure'

class OutputStructure
  attr_accessor :path

  def initialize(path)
    create_inner_output_structure(path)
    copy_files
    # create_inner_structure
    # create_writeable_files

  end

  def create_inner_output_structure(path)
    path = "/#{path}" if path[0] != "/"
    path.split("/")[1] == "Users" ? @home = path : @home = Dir.home + path
    FileUtils::mkdir_p @home + '/_output/css'
    FileUtils::mkdir_p @home + '/_output/pages'
    FileUtils::mkdir_p @home + '/_output/posts'
  end

  def copy_files
    Dir.glob(@home + '/source/*') do |file|
      FileUtils.cp(file, @home + '/_output')
    end
  end

  # def create_writeable_files
  #   placeholder_text = "This is placeholder text."
  #   date = Date.today.strftime("%Y-%m-%d")
  #   File.write(@home + '/_output/css/main.css', placeholder_text)
  #   File.write(@home + '/_output/pages/about.html', placeholder_text)
  #   File.write(@home + '/_output/index.html', placeholder_text)
  #   File.write(@home + '/_output/posts/' + date + '-welcome-to-hyde.html', placeholder_text)
  # end

end
