class BugsController < ApplicationController
  def index
    @bugs = Bug.where(:feature_id => params[:feature_id])

    respond_to do |format|
      format.json { render json: @bugs }
    end
  end

  def show
    @bug = Bug.find(params[:id])


    respond_to do |format|
      format.json { render json: @bug }
    end
  end

  def create
    @bug = Bug.new(params[:bug])
    @bug.feature_id = params[:feature_id]

    respond_to do |format|
      if @bug.save
        format.json { render json: @bug, status: :created}
      else
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @bug = Bug.find(params[:id])

    respond_to do |format|
      if @bug.update_attributes(params[:bug])
        format.json { render json: @bug, status: :updated }
      else
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bug = Bug.find(params[:id])
    @bug.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end
end