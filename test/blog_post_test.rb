require './test/test_helper'
require './lib/blog_post'
require './lib/structure'

class BlogPostTest < Minitest::Test
  def test_it_creates_an_additional_post_file_in_source
    folder = Structure.new('/Hyde_output')
    date = Date.today.strftime("%Y-%m-%d")
    folder_two = BlogPost.new('/Hyde_output', 'My Post')
    assert File.file?('./lib/Hyde_output/source/posts/' + date + '-my-post.md')
    FileUtils.rm_rf('./lib/Hyde_output')
  end

end
