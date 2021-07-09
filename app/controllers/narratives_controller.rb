class NarrativesController < ApplicationController
  before_action :set_narrative, only: %i[ show edit update destroy ]
  load_and_authorize_resource

  # GET /narratives or /narratives.json
  def index
    @narratives = Narrative.all
  end

  def open_registration
    Narrative.toggle_open

    redirect_back(fallback_location: narratives_path)
  end

  # GET /narratives/1 or /narratives/1.json
  def show
  end

  # GET /narratives/new
  def new
    @narrative = Narrative.new
    narrators = User.where(type: "Narrator")
    @narrators = []

    narrators.each do |narrator|
      @narrators.append([narrator.name, narrator.id])
    end
  end

  # GET /narratives/1/edit
  def edit
  end

  # POST /narratives or /narratives.json
  def create
    @narrative = Narrative.new(narrative_params)

    respond_to do |format|
      if @narrative.save
        format.html { redirect_to @narrative, notice: "Narrative was successfully created." }
        format.json { render :show, status: :created, location: @narrative }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @narrative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /narratives/1 or /narratives/1.json
  def update
    respond_to do |format|
      if @narrative.update(narrative_params)
        format.html { redirect_to @narrative, notice: "Narrative was successfully updated." }
        format.json { render :show, status: :ok, location: @narrative }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @narrative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /narratives/1 or /narratives/1.json
  def destroy
    @narrative.destroy
    respond_to do |format|
      format.html { redirect_to narratives_url, notice: "Narrative was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_narrative
      @narrative = Narrative.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def narrative_params
      params.require(:narrative).permit(:title, :size, :description, :user_id)
    end
end
