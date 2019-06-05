class ChallengesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @challenges = Challenge.where.not(latitude: nil, longitude: nil)

    @markers = @challenges.map do |challenge|
      {
        lat: challenge.latitude,
        lng: challenge.longitude,
        image_url: helpers.asset_url('garbage.png')
      }
    end
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

  def edit
    @challenge = Challenge.find(params[:id])
  end

  def update
    @challenge = Challenge.find(params[:id])

    if @challenge.update(challenge_params.merge(status: 1))
      organizer = @challenge.user
      organizer.score += 20
      organizer.save
      @challenge.users.each do |participant|
        participant.score += 10
        participant.save
      end

      redirect_to challenge_path(@challenge)
    else
      render 'update'
    end
  end

  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy
    redirect_to challenges_path
  end

  private

  def challenge_params
    parameters = params.require(:challenge).permit(:title, :place, :str_date, :photo, :photo_after)
    parameters.merge!({ date: DateTime.parse(params[:challenge][:str_date]) }) if @challenge.date.nil?
    # parameters[:date] = DateTime.parse(params[:challenge][:str_date])
    return parameters
  end
end
