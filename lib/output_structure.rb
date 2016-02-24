require './lib/structure'
require 'fileutils'
require 'kramdown'
require 'date'

class OutputStructure
  attr_accessor :path

  def initialize(path)
    path = "/#{path}" if path[0] != "/"
    path.split("/")[1] == "Users" ? @home = path : @home = Dir.home + path
    copy_files
    convert_md
  end

  def copy_files
    FileUtils.cp_r(@home + '/source/', @home + '/_output/')
  end

  def convert_md
    index_md = File.read(@home + '/_output/index.md')
    index_html = Kramdown::Document.new(index_md).to_html
    File.write(@home + '/_output/index.md', index_html)
    File.rename(@home + '/_output/index.md', @home + '/_output/index.html')
  end
end
