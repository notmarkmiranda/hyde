require './test/test_helper'
require './lib/output_structure'
require './lib/watch_changes'
require 'listen'

class WatchChangesTest < Minitest::Test
  def test_it_can_detect_a_change
    folder = Structure.new('/HydeTestOne')
    folder_two = OutputStructure.new('/HydeTestOne')
    listener = Listen.to('./lib/HydeTestOne/source') do |modified, added, removed|
      @modified = modified
      @added = added
        puts "modified absolute path: #{@modified}"
        puts "added absolute path: #{@added}"
        puts "removed absolute path: #{removed}"
    end

    listener.start
    sleep
    # File.write("./lib/HydeTestOne/source/index.md", "modified stuff")
    # File.write("./lib/HydeTestOne/source/pages/newpage.md", "new page test file")
    # assert !@added.empty?
    # assert !@modified.empy?
    # FileUtils.rm_rf('./lib/HydeTestOne')
  end


end
