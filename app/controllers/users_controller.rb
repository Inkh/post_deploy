class UsersController < ApplicationController

  before_action :check_status, except: [:index, :register, :log]

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

  def check_status
    if !session[:user_id]
      redirect_to ('/')
    end
  end

end
