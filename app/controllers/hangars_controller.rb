class HangarsController < ApplicationController
  before_action :set_hangar, only: [:show, :edit, :update, :destroy]
  skip_before_filter :logged_in, only: [:show, :index]


  # GET /hangars
  # GET /hangars.json
  def index
      @filterrific = initialize_filterrific(
      Hangar,
      params[:filterrific],
      select_options: {
        sorted_by: Hangar.options_for_sorted_by,
      },
      persistence_id: 'shared_key',
      default_filter_params: {},
      available_filters: [],
    ) or return

    @hangars = Hangar.order('hangar.airport.formatted_name  ASC')
    @grouped_hangars = Hangar.group(:airport_id)

     rescue ActiveRecord::RecordNotFound => e
      # There is an issue with the persisted param_set. Reset it.
      puts "Had to reset filterrific params: #{ e.message }"
      redirect_to(reset_filterrific_url(format: :html)) and return

  end

  # GET /hangars/1
  # GET /hangars/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render    :pdf => "file",
                  :template => 'hangars/show.html.erb',
                  :javascript_delay => '500',
                  :page_size =>        'Letter',
               margin:  {   top:               5,                     # default 10 (mm)
                            bottom:            5,
                            left:              0,
                            right:             0 }                  
       end        
     end 
  end



  # GET /hangars/new
  def new
    @hangar = Hangar.new
  end

  # GET /hangars/1/edit
  def edit
  end

  # POST /hangars
  # POST /hangars.json
  def create
    @hangar = Hangar.new(hangar_params)
    @hangar.owner = current_owner
    respond_to do |format|
      if @hangar.save
        format.html { redirect_to @hangar, notice: 'Hangar was successfully created.' }
        format.json { render :show, status: :created, location: @hangar }
      else
        format.html { render :new }
        format.json { render json: @hangar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hangars/1
  # PATCH/PUT /hangars/1.json
  def update
    respond_to do |format|
      if @hangar.update(hangar_params)
        format.html { redirect_to @hangar, notice: 'Hangar was successfully updated.' }
        format.json { render :show, status: :ok, location: @hangar }
      else
        format.html { render :edit }
        format.json { render json: @hangar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hangars/1
  # DELETE /hangars/1.json
  def destroy
    @hangar.destroy
    respond_to do |format|
      format.html { redirect_to hangars_url, notice: 'Hangar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hangar
      @hangar = Hangar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hangar_params
      params.require(:hangar).permit(:term, :rate, :owner_id, :airport_id, :hangar_type, :size, :last_payment, :first_payment, :leased, :hangar_number, :tennant, :tail_number)
    end
end
