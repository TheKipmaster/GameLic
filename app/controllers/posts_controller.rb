class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :set_narrative #, only: %i[ new edit create update destroy ]
  load_and_authorize_resource

  # GET /posts or /posts.json
  # def index
  #   @posts = Post.all
  # end

  # GET /posts/1 or /posts/1.json
  # def show
  # end

  # GET narrative/:id/posts/new
  def new
    # @post = Post.new
  end

  # GET narrative/:id/posts/1/edit
  def edit
  end

  # POST narrative/:id/posts or narrative/:id/posts.json
  def create
    # @post = Post.new(post_params)
    @post.user = current_user
    # @post.narrative = @narrative

    respond_to do |format|
      if @post.save
        format.html { redirect_to @narrative, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @narrative }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT narrative/:id/posts/1 or narrative/:id/posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @narrative, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @narrative }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE narrative/:id/posts/1 or narrative/:id/posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to @narrative, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_narrative
      @narrative = Narrative.find(params[:narrative_id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:body, :allow, files: [])
    end
end
