class StudentsController < ApplicationController
  before_action :set_narrative, only: %i[ choose_narrative ]

  def index
  end

  def choose_narrative
    authorize! :choose_narrative, @narrative

    if @narrative.full?
      redirect_to @narrative, alert: "Narrativa cheia!"
    else
      current_user.narrative = @narrative
      current_user.save

      redirect_back(fallback_location: @narrative)
    end
  end

  def update
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_narrative
    @narrative = Narrative.find(params[:narrative_id])
  end
end
