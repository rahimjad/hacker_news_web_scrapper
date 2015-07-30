
require './posterror.rb'

require 'pry'

class Post
  # include PostErrors
  attr_reader :title, :url, :points, :item_id, :comments

  def initialize (title, url, points, item_id)
    @title = title
    @url = url
    @points = points
    @item_id = item_id
    @comments = []
  end

  def add_comments(comments)
    comments.each do |comment|
      @comments << Comment.new(comment)
    end
  end 

  # raise TitleError, "there are no titles" unless @title
  # raise UrlError, "there is no url" unless @url
  # raise PointError, "there are no points recorded" unless @points
end












