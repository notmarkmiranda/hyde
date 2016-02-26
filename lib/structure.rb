require './lib/lib_header'
require './lib/error_check'

class Structure
  def initialize(path)
    create_outer_structure(path)
    create_inner_structure
    create_writeable_files
  end

  def create_outer_structure(path)
    @home = ErrorCheck.path_check(path)
    raise ArgumentError.new("PATH ALREADY EXISTS!") if File.directory?(@home)
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
    source = "#{@home}/source/"
    File.write("#{source}css/main.css", File.read('./lib/txt/maincss.txt'))
    File.write("#{source}pages/about.md", File.read('./lib/txt/about.txt'))
    File.write("#{source}layouts/default.html.erb", File.read('./lib/txt/erb.txt'))
    File.write("#{source}index.md", File.read('./lib/txt/index.txt'))
    File.write("#{source}posts/#{date}-welcome-to-hyde.md", File.read('./lib/txt/welcome.txt'))
  end
end
