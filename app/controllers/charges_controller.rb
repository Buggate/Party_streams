class ChargesController < ApplicationController



def new
end

def create
  # Amount in cents
  @amount = 15000
  

  customer = Stripe::Customer.create(
    :email => 'customer@party_streams.com',
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Stream your party live',
    :currency    => 'usd'
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end




end



