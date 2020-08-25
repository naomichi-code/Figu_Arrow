class Public::RequirementsController < ApplicationController
  def index
    @gives = Post.where(status: 1)
    @exchanges = Post.where(status: 2)
  end
end
