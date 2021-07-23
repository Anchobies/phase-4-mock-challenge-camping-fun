class CampersController < ApplicationController

    def index
        campers = Camper.all 
        render json: campers
    end

    def show
        if Camper.all.any? { |camp| camp.id.to_s == params[:id] }
            camper = Camper.find(params[:id])
            render json: camper, include: :activities
        else
            render json: {error: "Camper not found"}, status: 422
        end
    end

    def create
        camper = Camper.create(camper_params)
        if camper.valid?
            render json: camper
        else
            render json: { "errors": ["validation errors"] }, status: 422 
        end
    end

    private 

    def camper_params
        params.require(:camper).permit(:name, :age)
    end
end
