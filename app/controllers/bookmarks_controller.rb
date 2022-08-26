class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]
  # before_action :set_restaurant, only: %i[new create]
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = List.find(params[:list_id])
    @bookmark.movie = Movie.find(bookmark_params[:movie_id])
    @bookmark.save
    redirect_to list_path(params[:list_id])
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end
 # set list
  def set_list
   @list = List.find(params[:list_id])
  end

  def dstroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end
end
