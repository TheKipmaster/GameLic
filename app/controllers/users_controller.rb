class UsersController < ApplicationController
  def index
  end

  def choose_narrative
    current_user.narrative = Narrative.find(params[:narrative_id])
    current_user.save

    redirect_back(fallback_location: narratives_path)
  end

  def update
  end
end
