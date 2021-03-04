class ToursController < ApplicationController
  def index
    matching_tours = Tour.all

    @list_of_tours = matching_tours.order({ :created_at => :desc })

    render({ :template => "tours/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_tours = Tour.where({ :id => the_id })

    @the_tour = matching_tours.at(0)

    render({ :template => "tours/show.html.erb" })
  end

  def create
    the_tour = Tour.new
    the_tour.name = params.fetch("query_name")

    if the_tour.valid?
      the_tour.save
      redirect_to("/tours", { :notice => "Tour created successfully." })
    else
      redirect_to("/tours", { :notice => "Tour failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_tour = Tour.where({ :id => the_id }).at(0)

    the_tour.name = params.fetch("query_name")

    if the_tour.valid?
      the_tour.save
      redirect_to("/tours/#{the_tour.id}", { :notice => "Tour updated successfully."} )
    else
      redirect_to("/tours/#{the_tour.id}", { :alert => "Tour failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_tour = Tour.where({ :id => the_id }).at(0)

    the_tour.destroy

    redirect_to("/tours", { :notice => "Tour deleted successfully."} )
  end
end
