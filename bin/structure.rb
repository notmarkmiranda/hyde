class Structure
  attr_accessor :path

  def initialize(path)
    # @path = path
    create_outer_structure(path)
  end

  def create_outer_structure(path)
    home = Dir.home + '/' + path
    FileUtils::mkdir_p home
  end

  #create outer file structure
  # require 'fileutils'
  # FileUtils::mkdir_p '#{ARGV[1]}'

end
