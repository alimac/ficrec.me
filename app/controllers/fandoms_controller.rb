class FandomsController < ApplicationController

  def index
    @fandoms = Fandom.all
  end

  def show
    @fandom = Fandom.find(params[:id])
  end

  def new
    @fandom = Fandom.new
  end

  def edit
    @fandom = Fandom.find(params[:id])
  end

  def create
    @fandom = Fandom.new(fandom_params)

    if @fandom.save
      redirect_to @fandom
    else
      render 'new'
    end
  end

  def update
    @fandom = Fandom.find(params[:id])

    if @fandom.update(fandom_params)
      redirect_to @fandom
    else
      render 'edit'
    end
  end

  def destroy
    @fandom = Fandom.find(params[:id])
    @fandom.destroy

    redirect_to fandoms_path
  end

  private
    def fandom_params
      params.require(:fandom).permit(:name, :category)
    end
end
