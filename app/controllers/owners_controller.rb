class OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end

  def show
  end
  
  def create
  end
  
  def new
    @owner = Owner.new
  end

  def edit
  end

  def destroy
  end

  def update
  end
end
