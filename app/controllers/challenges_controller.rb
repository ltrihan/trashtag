class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @user = current_user
    @challenge.user = @user
    if @challenge.save
      redirect_to challenge_path(@challenge)
    else
      render 'new'
    end
  end

  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy
    redirect_to challenges_path
  end

  private

  def challenge_params
    params.require(:challenge).permit(:title, :place, :date)
  end
end
