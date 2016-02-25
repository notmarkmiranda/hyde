require './lib/lib_header'

class ErrorCheck
  attr_reader :home

  def self.path_check(path)
    path = "/#{path}" if path[0] != "/"
    path.split("/")[1] == "Users" ? @home = path : @home = __dir__ + path
  end
end
