class PlacesController < ApplicationController

    def index
        if params[:search_key]
            @places = Place.where("name LIKE ?", "%#{params[:search_key]}%")
        else    
            @places = Place.all
        end
    end

    def show
        @place = Place.find(params[:id])
        session[:page_visits] ||= 0
        session[:page_visits] = session[:page_visits].to_i + 1
    end

end
