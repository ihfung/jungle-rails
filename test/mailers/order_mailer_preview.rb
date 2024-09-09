class OrderMailerPreview < ActionMailer::Preview
  def order_receipt
    order = Order.first # Replace with an actual order
    OrderMailer.order_receipt(order)
  end
end
