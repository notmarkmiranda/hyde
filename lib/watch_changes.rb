require './lib/lib_header'
require './lib/output_structure'
require 'listen'

class WatchChanges
  def self.watch_changes(path)
    @home = ErrorCheck.path_check(path)
    raise ArgumentError.new("PATH DOES NOT EXIST!") if !File.directory?(@home)
    listener = Listen.to("#{@home}/source/") do |modified, added, removed|
      OutputStructure.new(path) if !modified.empty? || !added.empty?
    end
    listener.start
    sleep
  end
end
