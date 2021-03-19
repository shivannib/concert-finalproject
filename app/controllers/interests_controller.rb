class InterestsController < ApplicationController
  def index
    matching_interests = @current_user.interests

    @list_of_interests = matching_interests
    # .order({ :date => :asc, :name => :asc, :city => :desc })

    render({ :template => "interests/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_interests = Interest.where({ :id => the_id })

    @the_interest = matching_interests.at(0)

    #Added Code

    #matching_concerts = Concert.where({ :id => the_id })

    #@the_concert = matching_concerts.at(0)

    #matching_artists = Artist.where({ :id => the_id })

    #@the_artist = matching_artists.at(0)

    render({ :template => "interests/show.html.erb" })
  end

  def create
    the_interest = Interest.new
    the_interest.concert_id = params.fetch("query_concert_id")
    #the_interest.user_id = params.fetch("query_user_id")
    the_interest.user_id = @current_user.id

    if the_interest.valid?
      the_interest.save
      redirect_to("/concerts", { :notice => "Your interest has been successfully noted." })
    else
      redirect_to("/concerts", { :notice => "Your interest has failed to be successfully noted." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_interest = Interest.where({ :id => the_id }).at(0)

    the_interest.concert_id = params.fetch("query_concert_id")
    the_interest.user_id = params.fetch("query_user_id")

    if the_interest.valid?
      the_interest.save
      redirect_to("/interests/#{the_interest.id}", { :notice => "Interest updated successfully."} )
    else
      redirect_to("/interests/#{the_interest.id}", { :alert => "Interest failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_interest = Interest.where({ :id => the_id }).at(0)

    the_interest.destroy

    redirect_to("/interests", { :notice => "Interest deleted successfully."} )
  end
end
