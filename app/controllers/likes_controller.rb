class LikesController < ApplicationController
    def create
        idea = Idea.find(params['idea_id'])
        like = Like.new
        like.user = current_user
        like.idea = idea
        like.save
        return redirect_to :back
    end

end
