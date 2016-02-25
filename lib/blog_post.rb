require 'date'

class BlogPost
  def initialize(path, file_name)
    @home  = ErrorCheck.path_check(path)
    date = Date.today.strftime("%Y-%m-%d")
    file_extension = file_name.join("-").downcase
    blank_post  = "# #{file_name.join(" ")}\n\nYour content here"
    File.write("#{@home}/source/posts/#{date}-#{file_extension}.md", blank_post)
  end
end
