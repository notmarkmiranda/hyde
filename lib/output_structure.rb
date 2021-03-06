require './lib/structure'
require './lib/lib_header'

class OutputStructure
  attr_accessor :path

  def initialize(path)
    @home = ErrorCheck.path_check(path)
    raise ArgumentError.new("PATH DOES NOT EXIST!") if !File.directory?(@home)
    copy_files
    convert_md
  end

  def copy_files
    FileUtils.cp_r(@home + '/source/.', @home + '/_output/')
  end

  def convert_md
    @folders = Dir.glob("#{@home}/source/**/*").select do |file|
      file if file.include?("md" || "markdown") || !file.include?("source")
    end
    convert_html
  end

  def convert_html
    @folders.each do |file|
      current_file = File.read(file)
      html_content = Kramdown::Document.new(current_file, :auto_ids => false).to_html
      erb_template = File.read("#{@home}/source/layouts/default.html.erb")
      erb_formatted = ERB.new(erb_template).result(binding)
      file.sub!("source", "_output")
      File.write("#{file}", erb_formatted)
      File.rename("#{file}", "#{file.split(".")[0]}.html")
    end
  end
end
