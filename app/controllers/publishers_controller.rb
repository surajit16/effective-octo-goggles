class PublishersController < ApplicationController
  before_action :set_publisher, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @publishers = Publisher.all
    respond_with(@publishers)
  end

  def show
    respond_with(@publisher)
  end

  def new
    @publisher = Publisher.new
    respond_with(@publisher)
  end

  def edit
  end

  def create
    @publisher = Publisher.new(publisher_params)
    @publisher.save
    respond_with(@publisher)
  end

  def update
    @publisher.update(publisher_params)
    respond_with(@publisher)
  end

  def destroy
    @publisher.destroy
    redirect_to publishers_path
    #    respond_with(@publisher)
  end

  private
  def set_publisher
    if action_name=="show"
      @publisher = Publisher.includes(:albums).find(params[:id])
    else
      @publisher = Publisher.find(params[:id])
    end
  end

  def publisher_params
    params.require(:publisher).permit(:name, :address, :city, :state, :zip, :phone, :url)
  end
end
