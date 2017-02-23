class UsersController < ApplicationController

  before_action :check_status, except: [:index, :register, :log]

  def index
  end

  def view
      # @user = User.find(session[:user_id])
      @user = User.find(params[:id])
  end

  def create
  end

  def log
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      puts user.id
      session[:user_id] = user.id
      redirect_to ("/view/#{user.id}")
    else
      flash[:log_error] = "Something was wrong with log in credentials, please try again"
      redirect_to ('/')
    end
  end

  def out

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
