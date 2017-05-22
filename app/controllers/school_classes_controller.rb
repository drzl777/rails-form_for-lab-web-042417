class SchoolClassesController < ApplicationController

  def show
    @class = SchoolClass.find(params[:id])
  end

  def new
    @class = SchoolClass.new
  end

  def create
    @class = SchoolClass.new(school_class_params(:title, :room_number))
    if @class.save
      redirect_to school_class_path(@class)
    end
  end

  def edit
    @class = SchoolClass.find(params[:id])
  end

  def update
    @class = SchoolClass.find(params[:id])
    @class.update(school_class_params(:title, :room_number))
    if @class.save
      redirect_to school_class_path(@class)
    end
  end

  private

  def school_class_params(*args)

    params.require(:school_class).permit(*args)

  end


end
