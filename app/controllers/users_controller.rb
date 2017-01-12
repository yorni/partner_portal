class UsersController < ApplicationController
    before_action :set_user, only: [ :edit, :update]
    skip_before_filter :verify_logged_in, only: [:create_first_user]
    before_filter :verify_is_admin, except: [:create_first_user]
    def new
        @user = User.new
    end
    
     def index
        @users = User.all
    end
    
    def create
        @user = User.new(user_params)
        if @user.save 
            redirect_to users_path
        else
            render :new
        end
        
        
    end


    def update
        respond_to do |format|
            if @user.update(user_params)
                format.html { redirect_to users_path }
                format.json { render :show, status: :ok, location: @user }
            else
                format.html { render :edit }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    def edit

    end

    def create_first_user
        if User.all.count == 0
            user = User.new
            user.username = 'admin'
            user.password = '111'
            user.is_admin = true
            user.save
            render json: { result: true }
            else
                redirect_to root_url
        end

    end

    private
    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :is_admin, :description)
    end




    def set_user
        @user = User.find(params[:id])
    end
    
end
