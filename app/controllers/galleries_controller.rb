class GalleriesController < ApplicationController
	def index
    @galleries = Gallery.all #this uses active record to writ sql to get all authors
  end

  def show
    @gallery = Gallery.find params[:id]
  end

  def edit
    @gallery = Gallery.find params[:id]
  end

  def update
    @gallery = Gallery.find params[:id]
    @gallery.update gallery_params
    redirect_to gallery_path
  end

  def new
    @gallery = Gallery.new
  end

  def create
   gallery = Gallery.create gallery_params
   redirect_to gallery
  end

  def destroy
    gallery = Gallery.find params[:id]
    gallery.destroy
    redirect_to galleries_path
  end

  private
  def gallery_params
    params.require(:gallery).permit(:name, :image)
  end 
end