class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new params[:user]
    
    @user.password=@user.password.crypt(User::SALT)
    if @user.save
      flash[:notice] = 'Спасибо за регистрацию!'
      redirect_to tasks_path
    else
      @user.password=nil
      flash[:error] = 'Ошибка при регистрации.'
      render :action => :new
    end
  end
  
  def login
    if params[:user]
      login = params[:user][:login]
      password = params[:user][:password]
      @user = User.find_by_login(login)
      if @user and @user.password == password.crypt(User::SALT)
        flash[:notice] = "Добро пожаловать, #{@user.login}!"
        session[:user_id] = @user.id
        redirect_to tasks_path
      else
        
        #@user.password=nil
        flash[:error] = 'Неправильный логин и/или пароль.'
        render :action => :login
      end
    else
      @user = User.new
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = 'Вы успешно вышли.'
    redirect_to tasks_path
  end
end
