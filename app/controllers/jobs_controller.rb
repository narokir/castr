class JobsController < ApplicationController
  before_action :fetch_job, only: [:publish, :unpublish, :apply, :show, :edit, :update, :destroy]
  before_action :authenticate_member!, except: %i[index show search]

  def index
    @jobs = Job.published.all.limit(9)
  end

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @job = Job.new
    2.times { @job.roles.build }
  end

  def edit
  end

  def create
    @job = Job.new(job_params)
    @job.member = current_member

    respond_to do |format|
      if @job.save
        # @job.production_image.attach(params[:signed_blob_id])
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

  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to member_url(current_member), notice: "Job was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def apply
    @job = Job.find(params[:id])
    @talent = current_member
    respond_to :html
    JobMailer.with(talent: @talent, job: @job).apply_email.deliver_now
  end

  def search
    if params[:search].blank?
      redirect_to(root_path, notice: "Nothing to search") and return
    else
      @parameter = params[:search].downcase
      @results = Job.all.where("title ILIKE :search OR description ILIKE :search", search: "%#{@parameter}%")
    end
  end

  def publish
    respond_to do |format|
      if @job.update(published: true)
        format.js { redirect_to @job, notice: "This job is now published!" }
        #format.html { redirect_to @job, notice: "This job is now published!" }
        #format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def unpublish
    respond_to do |format|
      if @job.update(published: false)
        format.js { redirect_to @job, notice: "Job unpublished" }
        #format.html { redirect_to @job, notice: "Job unpublished" }
        #format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove_attachment
    @job = Job.find(params[:id])
    #@job.production_image.purge
    respond_to do |format|
      if @job.update(production_image: nil)
        format.js { }
        # format.html { render :edit, notice: "Image removed" }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
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
      :payment_details,
      :shoot_start_date,
      :shoot_end_date,
      :shoot_location,
      :special_instructions,
      :member_id,
      :production_image,
      :pay_interval,
      roles_attributes: [:id, :role_name, :role_description, :_destroy],
    )
  end
end
