require 'date'
require 'fileutils'
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
    placeholder_text = "This is placeholder text."
    placeholder_markdown = "# Some Markdown\n\n* a list\n* another item"
    date = Date.today.strftime("%Y-%m-%d")
    erb_file = File.read('./lib/erb.txt')
    css_file = File.read('./lib/maincss.txt')
    File.write(@home + '/source/css/main.css', css_file)
    File.write(@home + '/source/pages/about.md', placeholder_markdown)
    File.write(@home + '/source/layouts/default.html.erb', erb_file)
    File.write(@home + '/source/index.md', placeholder_markdown)
    File.write(@home + '/source/posts/' + date + '-welcome-to-hyde.md', placeholder_markdown)
  end

end
