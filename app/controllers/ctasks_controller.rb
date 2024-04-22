class CtasksController < ApplicationController
  before_action :set_ctask, only: %i[ show edit update destroy ]

  # GET /ctasks or /ctasks.json
  def index
    @ctasks = Ctask.all
  end

  # GET /ctasks/1 or /ctasks/1.json
  def show
  end

  # GET /ctasks/new
  def new
    @ctask = Ctask.new
  end

  # GET /ctasks/1/edit
  def edit
  end

  # POST /ctasks or /ctasks.json
  def create
    @ctask = Ctask.new(ctask_params)

    respond_to do |format|
      if @ctask.save
        format.html { redirect_to ctask_url(@ctask), notice: "Ctask was successfully created." }
        format.json { render :show, status: :created, location: @ctask }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ctask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ctasks/1 or /ctasks/1.json
  def update
    respond_to do |format|
      if @ctask.update(ctask_params)
        format.html { redirect_to ctask_url(@ctask), notice: "Ctask was successfully updated." }
        format.json { render :show, status: :ok, location: @ctask }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ctask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ctasks/1 or /ctasks/1.json
  def destroy
    @ctask.destroy!

    respond_to do |format|
      format.html { redirect_to ctasks_url, notice: "Ctask was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def delete_all_ctasks
    Ctask.destroy_all
    redirect_to root_path, notice: 'You are no longer consistent. Are you okay?'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ctask
      @ctask = Ctask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ctask_params
      params.require(:ctask).permit(:title, :description)
    end
end
