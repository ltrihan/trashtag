module ScoreHelper
  def user_score_to_css_width(user)
    "width: #{user.score_to_percentage}%;"
  end

  def user_score_to_css_position(user)
    "left: calc(#{user.score_to_percentage}% - 25px);"
  end
end
