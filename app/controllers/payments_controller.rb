# Author: Mohammed El-Ansary
# 30.4.2015
# Stripe payment
class PaymentsController < ApplicationController
  def index
  end

  # Display the amount entered by the user
  # and waits for him to enter credit card
  # credentials to complete the payment
  def new
    @amount = params[:amount].gsub(/\D/, '').to_i * 100
    if (@amount <= 0)
      redirect_to payments_path
    end
    if current_user.nil?
      redirect_to new_user_session_path
    end
  end

  # Completes the payment and updates the user's balance
  def create
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    # Amount in cents
    @amount = params[:value].gsub(/\D/, '').to_i
    if (@amount <= 0)
      redirect_to payments_path
    end
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
    user = current_user
    balance = user.balance + @amount
    user.balance = balance
    user.save
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to payments_path
  end
end
