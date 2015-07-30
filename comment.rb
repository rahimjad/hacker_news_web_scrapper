require 'nokogiri'
require 'pry'



class Comment
  attr_reader :comments
  def initialize(new_comments)
    @comments = new_comments
  end

end



