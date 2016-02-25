require './lib/structure'
require './lib/lib_header'

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
    html_content = Kramdown::Document.new(index_md, :auto_ids => false).to_html
    erb_template = File.read(@home + '/source/layouts/default.html.erb')
    erb_formatted = ERB.new(erb_template).result(binding)
    File.write(@home + '/_output/index.md', erb_formatted)
    File.rename(@home + '/_output/index.md', @home + '/_output/index.html')
    file_conversion_magic
  end


  def file_conversion_magic
    folders = ["pages", "posts"]
    folders.each do |folder|
      md_pages = Dir.entries("#{@home}/_output/#{folder}").find_all do |filename|
        filename.split(".")[-1] == "md"  || filename.split(".")[-1] == "markdown"
      end
      md_pages.each do |file|
        pages_md = File.read("#{@home}/_output/#{folder}/#{file}")
        html_content = Kramdown::Document.new(pages_md, :auto_ids => false).to_html
        erb_template = File.read("#{@home}/source/layouts/default.html.erb")
        erb_formatted = ERB.new(erb_template).result(binding)
        File.write("#{@home}/_output/#{folder}/#{file}", erb_formatted)
        File.rename("#{@home}/_output/#{folder}/#{file}", "#{@home}/_output/#{folder}/#{file.split(".")[0]}.html")
      end
    end
  end

end
