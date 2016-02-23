require 'FileUtils'

class Structure
  attr_accessor :path

  def initialize(path)
    create_outer_structure(path)
  end

  def create_outer_structure(path)
    home = Dir.home + path
    FileUtils::mkdir_p home
  end


end
