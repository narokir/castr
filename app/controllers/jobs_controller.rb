class JobsController < ApplicationController
  before_action :fetch_job, only: [:publish, :unpublish]
  before_action :set_job, only: %i[show edit update destroy]
  before_action :authenticate_member!, except: %i[index show]

  def index
    @jobs = Job.published.all.limit(9)
  end

  def show; end

  def new
    @job = Job.new
  end

  def edit; end

  def create
    @job = Job.new(job_params)
    @job.member = current_member

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: "Job was successfully created." }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: "Job was successfully updated." }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def publish
    respond_to do |format|
      if @job.update(published: true)
        format.html { redirect_to @job, notice: "This job is now published!" }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def unpublish
    respond_to do |format|
      if @job.update(published: false)
        format.html { redirect_to @job, notice: "Job unpublished" }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: "Job was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_job
    @job = Job.find(params[:id])
  end

  def fetch_job
    @job = Job.find(params.require(:id))
  end

  # Only allow a list of trusted parameters through.
  def job_params
    params.require(:job).permit(
      :title,
      :description,
      :company_name,
      :listing_expires,
      :url,
      :union_status,
      :payment,
      :payment_detials,
      :shoot_start_date,
      :shoot_end_date,
      :shoot_location,
      :special_instructions,
      :member_id,
      :production_image
    )
  end
end
