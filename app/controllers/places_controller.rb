class PlacesController < ApplicationController

    def index
        @places = Place.all
    end

    def show
        @place = Place.find(params[:id])
        session[:page_visits] ||= 0
        session[:page_visits] = session[:page_visits].to_i + 1
    end

end
