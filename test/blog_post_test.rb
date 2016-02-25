require './test/test_helper'
require './lib/blog_post'
require './lib/structure'

class BlogPostTest < Minitest::Test
  def test_it_creates_an_additional_post_file_in_source
    Structure.new('/Hyde_output')
    BlogPost.new('/Hyde_output', ['My', 'Post'])
    date = Date.today.strftime("%Y-%m-%d")
    assert File.file?('./lib/Hyde_output/source/posts/' + date + '-my-post.md')
    FileUtils.rm_rf('./lib/Hyde_output')
  end

  def test_it_writes_file_name_in_md_file
    Structure.new('/Hyde_output')
    BlogPost.new('/Hyde_output', ['My', 'Post'])
    date = Date.today.strftime("%Y-%m-%d")
    assert_equal "# My Post\n\nYour content here", File.read('./lib/Hyde_output/source/posts/'+ date + '-my-post.md')
    FileUtils.rm_rf('./lib/Hyde_output')
  end
end
