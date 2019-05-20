class BillingsController < ApplicationController
  before_action :authenticate_player!

  def cant_rags(amount)
    case amount
      when '7.38'
        '1.000 Rags'
      when '18.47'
        '2.500 Rags + 300 Bonus'
      when '44.32'
        '6.000 Rags + 1.500 Bonus'
      when '73.86'
        '10.000 Rags + 3.500 Bonus'
    end
  end

  def pre_pay
    amount = params[:amount]
    rags = params[:rags]
    if amount == "7.38" && rags == "1000" || amount == "18.47" && rags == "2800" || amount == "44.32" && rags == "7500" || amount == "73.86" && rags == "13500"
      pre_pay_accepted
    else
      redirect_to root_path, alert: "Pero porque? Si somos amigos:c"
    end
  end

  def pre_pay_accepted
    @amount = params[:amount]
    @rags = params[:rags]
    @rags_string = cant_rags(@amount)

    @payment = PayPal::SDK::REST::Payment.new({
      :intent =>  "sale",
      :payer =>  {
        :payment_method =>  "paypal" },
      :redirect_urls => {
        :return_url => "http://localhost:3000/billings/execute",
        :cancel_url => "http://localhost:3000/" },
      :transactions =>  [{
        :item_list => {
          :items => [{
            :name => @rags_string,
            :sku => @rags,
            :price => @amount,
            :currency => "USD",
            :quantity => 1 }]},
        :amount =>  {
          :total =>  @amount,
          :currency =>  "USD" },
        :description =>  "Tus Rags estan listos para competir y ganar." }]})

    if @payment.create
      redirect_url = @payment.links.find{ |v| v.method == 'REDIRECT' }.href
      redirect_to redirect_url
    else
      redirect_to root_path, alert: "Ups:c Solo un bug, no sabemos que paso, pero ahora si que funciona"
    end
  end

  def execute
    paypal_payment = PayPal::SDK::REST::Payment.find(params[:paymentId])
    if paypal_payment.execute(payer_id: params[:PayerID])

      amount = paypal_payment.transactions.first.amount.total
      rags_sum = paypal_payment.transactions.first.item_list.items[0].sku

      billing = Billing.create( player: current_player,
                                code: paypal_payment.id,
                                payment_method: 'paypal',
                                amount: amount,
                                currency: 'USD')

      current_player.rags += rags_sum.to_i
      current_player.save

      redirect_to root_path, notice: "La compra se realizó con éxito!"
    else
      render plain: "No se puedo generar el cobro en PayPal."
    end
  end
end
