class FanworksController < ApplicationController

  def index
    @fanworks = Fanwork.all
  end

  def show
    @fanwork = Fanwork.find(params[:id])
  end

  def new
    @fanwork = Fanwork.new
  end

  def edit
    @fanwork = Fanwork.find(params[:id])
  end

  def create
    @fanwork = Fanwork.new(fanwork_params)

    if @fanwork.save
      redirect_to @fanwork
    else
      render 'new'
    end
  end

  def update
    @fanwork = Fanwork.find(params[:id])

    if @fanwork.update(fanwork_params)
      redirect_to @fanwork
    else
      render 'edit'
    end
  end

  def destroy
    @fanwork = Fanwork.find(params[:id])
    @fanwork.destroy

    redirect_to fanworks_path
  end

  private
    def fanwork_params
      params.require(:fanwork).permit(:title, :link, :fandom_id, :review, :comment, collection_ids: [])
    end
end
