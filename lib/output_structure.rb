require './lib/structure'
require 'fileutils'
require 'kramdown'
require 'date'
require 'erb'

class OutputStructure
  attr_accessor :path

  def initialize(path)
    path = "/#{path}" if path[0] != "/"
    path.split("/")[1] == "Users" ? @home = path : @home = __dir__ + path
    copy_files
    convert_md
  end

  def copy_files
    FileUtils.cp_r(@home + '/source/.', @home + '/_output/')
  end

  def convert_md
    index_md = File.read(@home + '/_output/index.md')
    index_html = Kramdown::Document.new(index_md).to_html

    File.write(@home + '/_output/index.md', index_html)
    File.rename(@home + '/_output/index.md', @home + '/_output/index.html')

    # REFACTOR THESE TWO INTO ONE METHOD
    md_pages = Dir.entries(@home + '/_output/pages').find_all do |filename|
      filename.split(".")[-1] == "md"  || filename.split(".")[-1] == "markdown"
    end

    md_pages.each do |file|
      pages_md = File.read(@home + '/_output/pages/' + file)
      pages_html = Kramdown::Document.new(pages_md).to_html
      File.write(@home + '/_output/pages/' + file, pages_html)
      File.rename(@home + '/_output/pages/' + file, @home + '/_output/pages/' + file.split(".")[0] +'.html')
    end

    md_posts = Dir.entries(@home + '/_output/posts').find_all do |filename|
      filename.split(".")[-1] == "md"  || filename.split(".")[-1] == "markdown"
    end
    md_posts.each do |file|
      posts_md = File.read(@home + '/_output/posts/' + file)
      posts_html = Kramdown::Document.new(posts_md).to_html
      File.write(@home + '/_output/posts/' + file, posts_html)
      File.rename(@home + '/_output/posts/' + file, @home + '/_output/posts/' + file.split(".")[0] +'.html')

    end
    # REFACTOR THESE TWO INTO ONE METHOD

  end
end
