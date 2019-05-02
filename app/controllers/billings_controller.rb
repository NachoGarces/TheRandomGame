class BillingsController < ApplicationController

  def index
    @order
  end

  def pre_pay    
    @payment = Payment.new({
      :intent =>  "sale",
      :payer =>  {
        :payment_method =>  "paypal" },
      :redirect_urls => {
        :return_url => "http://localhost:3000/payment/execute",
        :cancel_url => "http://localhost:3000/" },
      :transactions =>  [{
        :item_list => {
          :items => [{
            :name => "Rags",
            :sku => "item",
            :price => "5",
            :currency => "USD",
            :quantity => 1 }]},
        :amount =>  {
          :total =>  "5",
          :currency =>  "USD" },
        :description =>  "Tus Rags estan listos para competir y ganar." }]})
  end
end
