require_dependency "kendocup/application_controller"

module Kendocup
  class CupsController < ApplicationController
    before_action :set_cup, only: [:show, :edit, :update, :destroy]

    # GET /cups
    def index
      @cups = Cup.all
    end

    # GET /cups/1
    def show
    end

    # GET /cups/new
    def new
      @cup = Cup.new
    end

    # GET /cups/1/edit
    def edit
    end

    # POST /cups
    def create
      @cup = Cup.new(cup_params)

      if @cup.save
        redirect_to @cup, notice: 'Cup was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /cups/1
    def update
      if @cup.update(cup_params)
        redirect_to @cup, notice: 'Cup was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /cups/1
    def destroy
      @cup.destroy
      redirect_to cups_url, notice: 'Cup was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_cup
        @cup = Cup.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def cup_params
        params.require(:cup).permit(:start_on, :end_on, :deadline)
      end
  end
end
