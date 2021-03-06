class UsersController < ApplicationController


    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        
        if @user.save
            login!(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = ['Youre bad at creating a user and you should feel bad']
            render :new
            # render json: @user.errors.full_messages
        end

    end

    def show
        @user = User.find(params[:id])
        render :show
    end

    def edit
        @user = User.find(params[:id])
        render :edit
    end

    def update
        @user = User.find(params[:id])

        if @user.update_attributes(user_params)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = ['Edit failed. you had one job.']
            render :edit
        end

    end


    private
    def user_params
        params.require(:user).permit(:email, :password)
    end


end