class EntitiesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @transactions = Entity.where(group_id: @group.id).order(id: :desc)
    @total_amount = @transactions.sum(:amount)
  end

  def new
    @transaction = Entity.new
    @group = Group.find(params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
    @transaction = @group.entities.build(entity_params)
    @transaction.user_id = current_user.id
    @transaction.author_id = current_user.id
    if @transaction.save
      redirect_to group_entities_path(@group.id)
    else
      render :new
    end
  end

  def destroy
    @transaction = Entity.find(params[:id])

    if @transaction.destroy
      redirect_to group_entities_path, notice: 'Transaction removed successfully!'
    else
      render :index, alert: 'Failed to remove Transaction'
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :group_id)
  end
end
