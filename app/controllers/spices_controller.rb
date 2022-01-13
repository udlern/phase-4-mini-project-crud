class SpicesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    def index
        render json: Spice.all
    end

    def show
        spice = Spice.find_by_id(params[:id])
        render json: spice
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = Spice.find_by_id(params[:id])
        spice.update(spice_params)
        render json: spice
    end

    def destroy
        spice = Spice.find_by_id(params[:id])
        spice.destroy
        head :no_content
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def render_not_found
        render json: {error: "Spice not found"}, status: :not_found
    end
end
