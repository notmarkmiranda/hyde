class Structure
  attr_accessor :path

  def initialize(path)
    @path = path
    create_outer_structure
  end

  def create_outer_structure(path)
    FileUtils::mkdir_p "#{path}"
  end

  #create outer file structure
  # require 'fileutils'
  # FileUtils::mkdir_p '#{ARGV[1]}'

end
