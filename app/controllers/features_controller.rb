class FeaturesController < ApplicationController
  def index
    @features = Feature.where(:project_id => params[:project_id])

    respond_to do |format|
      format.json { render json: @features }
    end
  end

  def show
    @feature = Feature.find(params[:id])

    respond_to do |format|
      format.json { render json: @feature }
    end
  end

  def create
    @feature = Feature.new(params[:feature])

    respond_to do |format|
      if @feature.save
        format.json { render json: @feature, status: :created }
      else
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @feature = Feature.find(params[:id])

    respond_to do |format|
      if @feature.update_attributes(params[:feature])
        format.json { render json: @feature, status: :updated }
      else
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @feature = Feature.find(params[:id])
    @feature.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end
end