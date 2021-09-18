class QuotationsController < ApplicationController
  def index
    @owner = Owner.find(params[:id])
    @quotations = @owner.quotations.page(params[:page]).per(10)
  end

  def new
    @owner = Owner.find(params[:id])
  end

  def show
  end

  def update
  end
end
