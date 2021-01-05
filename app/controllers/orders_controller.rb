class OrdersController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  def edit
    @order = Order.find_by(id: params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find_by(id: params[:id])
    @order.update(order_update_params)
    order_items_params = params[:order_items]
      order_items_params.each do |key, value|
        order_item = OrderItem.find_by(id: value[:id])
        if order_item
          order_item.update(
            place: value[:place],
            issue_object: value[:issue_object],
            issue: value[:issue],
            need_to: value[:need_to]
          )
        else
          unless value[:place].blank? || value [:issue_object].blank? || value[:issue].blank? || value[:need_to].blank?
            OrderItem.create(
              place: value[:place],
              issue_object: value[:issue_object],
              issue: value[:issue],
              need_to: value[:need_to],
              order_id: @order.id,
              user_id: current_user.id
            )
          end
        end
      end
    flash[:notice] = 'Order was updated'
    redirect_to @order

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

  def order_update_params
    params.require(:order).permit(:user_id, :client_organisation, :note)
  end



end