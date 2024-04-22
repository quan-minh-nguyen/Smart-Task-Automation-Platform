class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to task_url(@task), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy!

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  # def push_back_tasks
  #   # Get the current date and the date one week ago
  #   current_date = Date.today
  #   previous_week_date = current_date - 7.days

  #   # Iterate over each day in the upcoming week
  #   (current_date..(current_date + 6.days)).each do |date|
  #     # Check if there are any tasks scheduled for the current day
  #     tasks_for_current_day = Task.where("DATE(start_time) = ?", date)

  #     # If there are no tasks scheduled for the current day,
  #     # check if there are tasks scheduled for the corresponding day one week ago
  #     if tasks_for_current_day.empty?
  #       tasks_for_previous_day = Task.where("DATE(start_time) = ?", previous_week_date + (date - current_date).days)

  #       # If there are tasks scheduled for the corresponding day one week ago,
  #       # update the start_time and end_time of those tasks to be one week later
  #       if tasks_for_previous_day.present?
  #         tasks_for_previous_day.each do |task|
  #           task.update(start_time: task.start_time + 1.week, end_time: task.end_time + 1.week)
  #         end
  #       end
  #     end
  #   end
  #   redirect_to root_path, notice: "Tasks pushed back successfully!"
  # end
  def create_random_task
    # Check if there are any ctask records
    if Ctask.any?
      @task = Task.new
      @task.start_time = Time.zone.now.beginning_of_day + 9.hours
      @task.end_time = Time.zone.now.beginning_of_day + 17.hours

      # Select a random ctask
      random_ctask = Ctask.order("RANDOM()").first

      # Set task attributes based on ctask
      @task.title = random_ctask.title
      @task.description = random_ctask.description

      if @task.save
        redirect_to root_path, notice: 'Task was successfully created.'
      else
        redirect_to root_path, alert: 'Failed to create task.'
      end
    else
      redirect_to root_path, alert: 'No consistent task available to create task.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :description, :start_time, :end_time)
    end

end
