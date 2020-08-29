class Public::HomesController < ApplicationController
    def top
        @posts = Post.all.reverse_order
        @requirements = Post.where(status: 1).or(Post.where(status: 2)).order(updated_at: :desc)

    end

    def about
    end


end
