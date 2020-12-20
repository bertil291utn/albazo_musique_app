class DpasController < ApplicationController
  before_action :set_dpa, only: [:show, :edit, :update, :destroy]

  # GET /dpas
  # GET /dpas.json
  def index
    @dpas = Dpa.all
  end

  # GET /dpas/1
  # GET /dpas/1.json
  def show
  end

  # GET /dpas/new
  def new
    @dpa = Dpa.new
  end

  # GET /dpas/1/edit
  def edit
  end

  # POST /dpas
  # POST /dpas.json
  def create
    @dpa = Dpa.new(dpa_params)

    respond_to do |format|
      if @dpa.save
        format.html { redirect_to @dpa, notice: "Dpa was successfully created." }
        format.json { render :show, status: :created, location: @dpa }
      else
        format.html { render :new }
        format.json { render json: @dpa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dpas/1
  # PATCH/PUT /dpas/1.json
  def update
    respond_to do |format|
      if @dpa.update(dpa_params)
        format.html { redirect_to @dpa, notice: "Dpa was successfully updated." }
        format.json { render :show, status: :ok, location: @dpa }
      else
        format.html { render :edit }
        format.json { render json: @dpa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dpas/1
  # DELETE /dpas/1.json
  def destroy
    @dpa.destroy
    respond_to do |format|
      format.html { redirect_to dpas_url, notice: "Dpa was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_dpa
    @dpa = Dpa.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def dpa_params
    params.require(:dpa).permit(:description, :hierarchy, :bg_url, :dpa_id)
  end
end
