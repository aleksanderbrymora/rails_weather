class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end

  def show
    @animal = Animal.find params[:id]
  end

  def edit
    @animal = Animal.find params[:id]
  end

  def new
    @animal = Animal.new
  end

  def create
    animal = Animal.new animal_params
    if params[:animal][:images].present?
      params[:animal][:images].each do |image|
        res = Cloudinary::Uploader.upload(image)
        animal.images << res["public_id"]
      end
    end
    animal.save
    redirect_to animal
  end

  private

  def animal_params
    params.require(:animal).permit(:name)
  end

end
