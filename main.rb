require './post.rb'
require './comment.rb'
require 'nokogiri'
require 'open-uri'
require 'colorize'


  class MissingArgumentError < StandardError; end

def run
  path = ARGV[0]
  raise MissingArgumentError, "Nothing was entered!!" unless path
  
  response = open(path)
  # raise PathUndefined, "No Path!" unless response
  doc = Nokogiri::HTML(response)

  title = doc.search('.title > a').map { |span| span.inner_text}[0]
  url = doc.search('.title > a').map {|link| link['href']}[0]
  points = doc.search('.subtext > span:first-child').map { |span| span.inner_text}[0]
  item_id = doc.search('.subtext > a:nth-child(3)').map {|link| link['href']}[0]
  post = Post.new(title, url, points, item_id)
  comments = doc.search('.comment').map { |span| span.inner_text}
  post.add_comments(comments)
  print "The title for the Article is" 
  puts " #{post.title}".colorize(:green)
  print "The article's url is" 
  puts " #{post.url}".colorize(:red)
  print "The item ID is"  
  puts " #{post.item_id}".colorize(:blue)
  print "This post has" 
  puts " #{post.points}".colorize(:magenta)
  print "This post has" 
  puts" #{post.comments.count} comments".colorize(:light_blue) 
rescue Errno::ENOENT
  puts  "Invalid file"
end

run

