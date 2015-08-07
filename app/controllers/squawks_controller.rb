class SquawksController < ApplicationController
  # before_action :set_squawk, only: [:show, :edit, :update, :destroy]

  # GET /squawks
  # GET /squawks.json
  def index
    # @squawks = current_user.all_following.squawks
  end

  # GET /squawks/1
  # GET /squawks/1.json
  def show
  end

  # GET /squawks/new
  def new
    @squawk = Squawk.new
  end

  # GET /squawks/1/edit
  def edit
  end

  # squawk /squawks
  # squawk /squawks.json
  def create
    @squawk = Squawk.new(squawk_params)

    respond_to do |format|
      if @squawk.save
        format.html { redirect_to @squawk, notice: 'squawk was successfully created.' }
        format.json { render :show, status: :created, location: @squawk }
      else
        format.html { render :new }
        format.json { render json: @squawk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /squawks/1
  # PATCH/PUT /squawks/1.json
  def update
    respond_to do |format|
      if @squawk.update(squawk_params)
        format.html { redirect_to @squawk, notice: 'Squawk was successfully updated.' }
        format.json { render :show, status: :ok, location: @squawk }
      else
        format.html { render :edit }
        format.json { render json: @squawk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /squawks/1
  # DELETE /squawks/1.json
  def destroy
    @squawk.destroy
    respond_to do |format|
      format.html { redirect_to squawks_url, notice: 'Squawk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_squawk
      @squawk = Squawk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def squawk_params
      params.require(:squawk).permit(:body, :user_id)
    end
end
