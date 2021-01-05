class OrdersController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  def new
    @order = Order.new()
    @order_items = OrderItem.new()
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      order_items_params = params[:order_items]
      order_items_params.each do |key, val|
        unless val[:place].blank? || val[:issue_object].blank? || val[:issue].blank? || val[:need_to].blank?
          OrderItem.create(
            place: val[:place],
            issue_object: val[:issue_object],
            issue: val[:issue],
            need_to: val[:need_to],
            order_id: @order.id,
            user_id: current_user.id
          )

        end
      end

      flash[:notice] = 'Order created'
      redirect_to orders_path
    end
  end

  def destroy
    @order = Order.find_by(id: params[:id])
    if @order.delete
      flash[:alert] = 'Заявка удалена'
      redirect_to orders_path
    end
  end



  private

  def order_params
    params.require(:order).permit(:user_id, :client_organisation, :note)
  end



end