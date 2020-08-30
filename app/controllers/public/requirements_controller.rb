class Public::RequirementsController < ApplicationController
  def index
    @gives = Post.where(status: 1).order(updated_at: :desc)
    @exchanges = Post.where(status: 2).order(updated_at: :desc)
  end
end
