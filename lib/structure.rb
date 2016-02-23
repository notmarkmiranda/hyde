
class Structure
  attr_accessor :path

  def initialize(path)
    create_outer_structure(path)
  end

  def create_outer_structure(path)
    # FileUtils::mkdir_p "#{path}"
    FileUtils::mkdir_p "#{path}"
  end

  # def create_inner_structure
  #   FileUtils::mkdir_p '/source/css'
  # end

  # File.write to file



  #create outer file structure
  # require 'fileutils'
  # FileUtils::mkdir_p '#{ARGV[1]}'

end
