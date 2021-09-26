class QuotationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @owner = Owner.find(params[:id])
    @quotations = @owner.quotations.page(params[:page]).per(10) #ページネーション
  end

  def new
    @owner = Owner.find(params[:id])
    @user = current_user
    @quotation = Quotation.new
  end

  def create
    @quotation = Quotation.new(quotation_params)
    if @quotation.save!
      redirect_to quotation_path(@quotation)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @quotation = Quotation.find(params[:id])
    @owner = @quotation.owner
  end

  def edit
    @quotation = Quotation.find(params[:id])
  end

  def update
    @quotation = Quotation.find(params[:id])
    if @quotation.update(quotation_params)
      flash[:success] = "情報を更新しました"
      redirect_to quotation_path(@quotation)
    else
      render 'edit'
    end
  end

  def destroy
    @quotation = Quotation.find(params[:id])
    @quotation.destroy!
    redirect_to quotations_index_path(@quotation.owner.id)
  end

  private

  def quotation_params
    params.require(:quotation).permit(:pdf, :created_at, :user_id, :owner_id, :manufacturer_name, :comment, :item_name)
  end
end
