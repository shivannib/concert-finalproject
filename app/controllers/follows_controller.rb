class FollowsController < ApplicationController
  def index
    matching_follows = Follow.all

    @list_of_follows = matching_follows.order({ :created_at => :desc })

    render({ :template => "follows/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_follows = Follow.where({ :id => the_id })

    @the_follow = matching_follows.at(0)

    render({ :template => "follows/show.html.erb" })
  end

  def create
    the_follow = Follow.new
    the_follow.user_id = params.fetch("query_user_id")
    the_follow.artist_id = params.fetch("query_artist_id")

    if the_follow.valid?
      the_follow.save
      redirect_to("/follows", { :notice => "Follow created successfully." })
    else
      redirect_to("/follows", { :notice => "Follow failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_follow = Follow.where({ :id => the_id }).at(0)

    the_follow.user_id = params.fetch("query_user_id")
    the_follow.artist_id = params.fetch("query_artist_id")

    if the_follow.valid?
      the_follow.save
      redirect_to("/follows/#{the_follow.id}", { :notice => "Follow updated successfully."} )
    else
      redirect_to("/follows/#{the_follow.id}", { :alert => "Follow failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_follow = Follow.where({ :id => the_id }).at(0)

    the_follow.destroy

    redirect_to("/follows", { :notice => "Follow deleted successfully."} )
  end
end
