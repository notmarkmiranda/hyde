require 'date'
require 'fileutils'
require 'pry'
require './lib/structure'

class OutputStructure
  attr_accessor :path

  def initialize(path)
    path = "/#{path}" if path[0] != "/"
    path.split("/")[1] == "Users" ? @home = path : @home = Dir.home + path
    copy_files
  end

  def copy_files
    FileUtils.cp_r(@home + '/source/', @home + '/_output/')
  end
end
