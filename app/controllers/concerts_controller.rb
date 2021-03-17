class ConcertsController < ApplicationController
  
  def home

    @q = Concert.ransack(params[:q])
    @concerts = @q.result

    render({ :template => "concerts/home.html.erb" })
  end
  
  def index

    matching_concerts = Concert.all

    @list_of_concerts = matching_concerts.order({ :created_at => :desc })

    render({ :template => "concerts/index.html.erb" })

  end

  def view_everything
    matching_concerts = Concert.all.order({ :date => :asc, :name => :asc, :city => :desc })

    @list_of_concerts = matching_concerts.order({ :created_at => :desc })

    matching_artists = Artist.all

    @list_of_artists = matching_artists.order({ :created_at => :desc })
    
    render({ :template => "concerts/viewall.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_concerts = Concert.where({ :id => the_id })

    @the_concert = matching_concerts.at(0)

    matching_artists = Artist.where({ :id => the_id })

    @the_artist = matching_artists.at(0)

    render({ :template => "concerts/show.html.erb" })
  end

  def create
    the_concert = Concert.new
    the_concert.date = params.fetch("query_date")
    the_concert.ticket_time = params.fetch("query_ticket_time")
    the_concert.city = params.fetch("query_city")
    the_concert.artist_id = params.fetch("query_artist_id")
    the_concert.name = params.fetch("query_concert_id")
    #the_concert.tour_id = params.fetch("query_tour_id")

    if the_concert.valid?
      the_concert.save
      redirect_to("/concerts", { :notice => "Concert created successfully." })
    else
      redirect_to("/concerts", { :notice => "Concert failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_concert = Concert.where({ :id => the_id }).at(0)

    the_concert.date = params.fetch("query_date")
    the_concert.city = params.fetch("query_city")
    the_concert.name = params.fetch("query_concert_id")
    #the_concert.artist_id = params.fetch("query_artist_id")
    #the_concert.tour_id = params.fetch("query_tour_id")

    if the_concert.valid?
      the_concert.save
      redirect_to("/concerts/#{the_concert.id}", { :notice => "Concert updated successfully."} )
    else
      redirect_to("/concerts/#{the_concert.id}", { :alert => "Concert failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_concert = Concert.where({ :id => the_id }).at(0)

    the_concert.destroy

    redirect_to("/concerts", { :notice => "Concert deleted successfully."} )
  end

  def bookmarked_concerts
    redirect_to("/interests")
  end

end
