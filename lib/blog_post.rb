require 'date'

class BlogPost
  def initialize(path, file_name)
    @home  = ErrorCheck.path_check(path)
    file_extension = file_name.join("-").downcase
    date = Date.today.strftime("%Y-%m-%d")
    File.write(@home + '/source/posts/' + date + '-' + file_extension + '.md', "# #{file_name.join(" ")}\n\nYour content here")
  end
end
