class AmenitiesController < ApplicationController
  before_action :set_amenity, only: %i[ show edit update destroy ]

  # GET /amenities or /amenities.json
  def index
    if params[:query].present?
      @amenities = Amenity.where("name LIKE ?", "%#{params[:query]}%")
    else
      @amenities = Amenity.all
    end
  end

  # GET /amenities/1 or /amenities/1.json
  def show
  end

  # GET /amenities/new
  def new
    @amenity = Amenity.new(isActive: true)
  end

  # GET /amenities/1/edit
  def edit
  end

  # POST /amenities or /amenities.json
  def create
    @amenity = Amenity.new(amenity_params)

    respond_to do |format|
      if @amenity.save
        format.html { redirect_to amenities_path, notice: "Amenity was successfully created." }
        format.json { render :show, status: :created, location: @amenity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @amenity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /amenities/1 or /amenities/1.json
  def update
    respond_to do |format|
      if @amenity.update(amenity_params)
        format.html { redirect_to amenities_path, notice: "Amenity was successfully updated." }
        format.json { render :show, status: :ok, location: @amenity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @amenity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /amenities/1 or /amenities/1.json
  def destroy
    @amenity.destroy!

    respond_to do |format|
      format.html { redirect_to amenities_path, status: :see_other, notice: "Amenity was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    def set_amenity
      @amenity = Amenity.find(params[:id])
    end

    def amenity_params
      params.require(:amenity).permit(:name, :isActive)
    end
end
