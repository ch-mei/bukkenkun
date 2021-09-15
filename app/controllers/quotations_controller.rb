class QuotationsController < ApplicationController
  def index
    @owner = Owner.find(params[:id])
  end

  def show
  end

  def update
  end
end
