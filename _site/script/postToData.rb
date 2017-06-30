#required ruby gems
require 'yaml'
require 'psych'
require 'fileutils'

#read in YAML file into a variable
postData = begin
    YAML.load(File.open("_data/contentful/spaces/posts.yaml"))
rescue ArgumentError => e
    puts "Could not parse YAML: #{e.message}"
end

#get number of newsArticle and post elements
num_of_posts = "#{postData['post'].length}"
post_counter = 0
puts "Deleting old post data"
FileUtils.rm_rf(Dir.glob('_posts/*'))
dirname = '_posts'

unless File.directory?(dirname)
    FileUtils.mkdir_p(dirname)
end
#create credit posts in _posts/credits
begin
    puts "Creating post files"
    #create filename for post MD file in the format 'yyyy-mm-dd-some-title.md'
    post_date = "#{postData['post'][post_counter]['date']}".partition('T').first
    title_slug = "#{postData['post'][post_counter]['title']}".downcase.gsub(" ", "-")
    filename = post_date + "-" + title_slug + ".md"
    puts filename

    #create post file and append YAML front matter data
    File.open("_posts/#{filename}", "w") do |f|
        f.puts "---"
        f.puts "layout: post"
        f.puts "title: #{postData['post'][post_counter]['title']}"
        f.puts "date: #{postData['post'][post_counter]['date']}"
        f.puts "id: #{postData['post'][post_counter]['id']}"

        f.puts "---"

        content = "#{postData['post'][post_counter]['content']}"
        if content != ''
            f.puts "#{content}"
        end
    end

    post_counter+=1
end while post_counter < num_of_posts.to_i
