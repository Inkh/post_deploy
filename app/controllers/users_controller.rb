class UsersController < ApplicationController
  def index
  end

  def view
  end

  def create
  end

  def register
    user = User.create(name: params['name'], email: params['email'], password: params['pw'], password_confirmation: params['pw_confirm'])
    if user.valid?
      session[:user_id] = user.id
      redirect_to ("/view/#{user.id}")
    else
      flash[:errors] = user.errors.full_messages.to_sentence
      redirect_to ("/")
  end
end
