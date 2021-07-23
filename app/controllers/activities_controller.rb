class ActivitiesController < ApplicationController

    def index
        activities=Activity.all 
        render json: activities 
    end

    def destroy
        if Activity.all.any? { |activ| activ.id.to_s == params[:id] }
            activity = Activity.find(params[:id])
            activity.destroy
            render json: activity
        else
            render json: {error: "Activity not found"}, status: 404
        end
    end
end
