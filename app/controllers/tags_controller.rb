class TagsController < ApplicationController

  def index
    @tags = Post.tag_counts_on(:tags)
  end

  def show
    #@posts =
    @tag = Post.tag_counts_on(:tags).find(params[:id])
    @posts = Post.tagged_with(@tag)
  end

end
