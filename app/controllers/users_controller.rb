class UsersController < ApplicationController
  before_action :set_narrative, only: %i[ choose_narrative ]
  before_action :set_user, only: %i[ show edit update ]
  before_action :set_narratives, only: %i[ edit update index ]
  skip_before_action :finish_registration, only: %i[ edit update ]
  load_and_authorize_resource :except => %i[ choose_narrative ]

  def index
    @remaining_students = Student.where(narrative_id: nil)
    @narrators = Narrator.all
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

  def show
  end

  def edit
  end

  def update
    # byebug
    respond_to do |format|
      if @user.update(user_params)
        if current_user == @user
          format.html { redirect_to user_path(@user), notice: "User was successfully updated." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { redirect_to users_path, notice: "User was successfully updated." }
          format.json { render :show, status: :ok, location: @user }
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_narrative
      @narrative = Narrative.find(params[:narrative_id])
    end

    def set_narratives
      @narratives = Narrative.all
      @narratives_select = [["Nenhuma", nil]]

      @narratives.each do |narrative|
        @narratives_select.append([narrative.title, narrative.id])
      end
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(
        :name, :nickname, :narrative_id, :type,
        :institution, :registration_number, :age,
        :portrait, :character_sheet, :avatar, :cover,
      )
    end
end
