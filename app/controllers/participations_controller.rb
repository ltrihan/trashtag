class ParticipationsController < ApplicationController

    def create
        @user = current_user
        @challenge = challenge.find(params[:challenge_id])
        @participation = participation.new
        @participation.challenge = @challenge
        @participation.user = @user
        if @participation.save
            redirect_to challenges_path(@challenge)
        else
            render :new
        end
    end
end
