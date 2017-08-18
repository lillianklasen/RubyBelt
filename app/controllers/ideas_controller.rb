class IdeasController < ApplicationController

    def create
        idea = Idea.new(idea_params)
        idea.user = current_user

        if (idea.valid?)
            idea.save
            redirect_to "/bright_ideas"
        else
            flash[:notice] = idea.errors.full_messages
            redirect_to "/bright_ideas"
        end
    end

    def show
        @idea = Idea.find(params[:id])
    end

    def destroy
        idea = Idea.find(params[:id])
        idea.destroy
        return redirect_to :back
    end

    private
        def idea_params
            params.require(:idea).permit(:content)
        end
end
