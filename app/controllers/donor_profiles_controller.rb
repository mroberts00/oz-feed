class DonorProfilesController < ApplicationController
  include CurrentCart
  before_action :set_cart
  before_action :set_donor_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_donor!


  # GET /donor_profiles
  # GET /donor_profiles.json
  def index
    @donor_profiles = DonorProfile.all
  end

  # GET /donor_profiles/1
  # GET /donor_profiles/1.json
  def show
  end

  # GET /donor_profiles/new
  def new
    @donor_profile = DonorProfile.new
  end

  # GET /donor_profiles/1/edit
  def edit
  end

  # POST /donor_profiles
  # POST /donor_profiles.json
  def create
    @donor_profile = DonorProfile.new(donor_profile_params)
    @donor_profile.donor_id = current_donor.id
    respond_to do |format|
      if @donor_profile.save
        format.html { redirect_to @donor_profile, notice: 'Donor profile was successfully created.' }
        format.json { render :show, status: :created, location: @donor_profile }
      else
        format.html { render :new }
        format.json { render json: @donor_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /donor_profiles/1
  # PATCH/PUT /donor_profiles/1.json
  def update
    respond_to do |format|
      if @donor_profile.update(donor_profile_params)
        format.html { redirect_to @donor_profile, notice: 'Donor profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @donor_profile }
      else
        format.html { render :edit }
        format.json { render json: @donor_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donor_profiles/1
  # DELETE /donor_profiles/1.json
  def destroy
    @donor_profile.destroy
    respond_to do |format|
      format.html { redirect_to donor_profiles_url, notice: 'Donor profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donor_profile
      @donor_profile = DonorProfile.find(params[:id])
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donor_profile_params
      params.require(:donor_profile).permit(:first_name, :last_name, :avatar, :street_line_one, :street_line_two, :suburb, :postcode, :state, :country, :phone_number)
    end
end
