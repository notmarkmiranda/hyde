require 'date'

class BlogPost
  def initialize(path, file_name)
    path = "/#{path}" if path[0] != "/"
    path.split("/")[1] == "Users" ? @home = path : @home = __dir__ + path
    file_extension = file_name.join("-").downcase
    date = Date.today.strftime("%Y-%m-%d")
    File.write(@home + '/source/posts/' + date + '-' + file_extension + '.md', "# #{file_name.join(" ")}\n\nYour content here")
  end
end
