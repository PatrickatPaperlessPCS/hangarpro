class LeasesController < ApplicationController
  before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?
    

  before_action :set_lease, only: [:show, :edit, :update, :destroy]
  before_action :set_hangar
  # GET /leases
  # GET /leases.json
  def index
    @leases = Lease.all
  end

  # GET /leases/1
  # GET /leases/1.json
  def show
  end

  # GET /leases/new
  def new
    @lease = Lease.new
  end

  # GET /leases/1/edit
  def edit
  end

  # POST /leases
  # POST /leases.json
  def create
    @lease = @hangar.build_lease(lease_params)
    respond_to do |format|
      if @lease.save
        format.html { redirect_to hangars_path, notice: 'Lease was successfully created.' }
        format.json { render :show, status: :created, location: @lease }

      else
        format.html { render :new }
        format.json { render json: @lease.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leases/1
  # PATCH/PUT /leases/1.json
  def update
    respond_to do |format|
      if @lease.update(lease_params)
        format.html { redirect_to @lease, notice: 'Lease was successfully updated.' }
        format.json { render :show, status: :ok, location: @lease }
      else
        format.html { render :edit }
        format.json { render json: @lease.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leases/1
  # DELETE /leases/1.json
  def destroy
    @lease.destroy
    respond_to do |format|
      format.html { redirect_to leases_url, notice: 'Lease was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lease
      @lease = Lease.find(params[:id])
    end

    def set_hangar
      @hangar = Hangar.find(params[:hangar_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lease_params
      params.require(:lease).permit(:lease_start, :lease_term, :lease_end, :lease_signed, :signature, :additional_file)
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:admin, :first_name, :last_name, :signed_lease, :lease_expires, :company, :airport_id])
      devise_parameter_sanitizer.permit(:account_update, keys: [:admin, :first_name, :last_name, :signed_lease, :lease_expires, :company, :airport_id])
    end  
end
