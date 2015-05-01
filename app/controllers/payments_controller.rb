# Author: Mohammed El-Ansary
# 30.4.2015
# Stripe payment
class PaymentsController < ApplicationController
  def index
  end

  def new
    @amount = params[:amount].gsub(/\D/, '').to_i * 100
  end

  def create
    # Amount in cents
    @amount = params[:value].gsub(/\D/, '').to_i

    customer = Stripe::Customer.create(
      email: 'example@stripe.com',
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to payments_path
  end
end
