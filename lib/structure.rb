require './lib/lib_header'
require 'pry'

class Structure
  attr_accessor :path

  def initialize(path)
    create_outer_structure(path)
    create_inner_structure
    create_writeable_files
  end

  def create_outer_structure(path)
    path = "/#{path}" if path[0] != "/"
    path.split("/")[1] == "Users" ? @home = path : @home = __dir__ + path
    raise ArgumentError.new("THE FILEPATH ALREADY EXISTS!") if File.directory?(@home)
    FileUtils::mkdir_p @home
  end

  def create_inner_structure
    FileUtils::mkdir_p @home + '/source/css'
    FileUtils::mkdir_p @home + '/source/pages'
    FileUtils::mkdir_p @home + '/source/layouts'
    FileUtils::mkdir_p @home + '/source/posts'
  end

  def create_writeable_files
    date = Date.today.strftime("%Y-%m-%d")
    File.write(@home + '/source/css/main.css', File.read('./lib/txt/maincss.txt'))
    File.write(@home + '/source/pages/about.md', File.read('./lib/txt/about.txt'))
    File.write(@home + '/source/layouts/default.html.erb', File.read('./lib/txt/erb.txt'))
    File.write(@home + '/source/index.md', File.read('./lib/txt/index.txt'))
    File.write(@home + '/source/posts/' + date + '-welcome-to-hyde.md', File.read('./lib/txt/welcome.txt'))
  end

end
