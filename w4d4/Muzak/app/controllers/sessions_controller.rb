class SessionsController < ApplicationController


    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
            )
        # debugger
        if @user
            login!(@user)
            # debugger
            redirect_to user_url(@user) 
        else
            @user = User.new
            flash.now[:errors] = ['bad login.']
            render :new
        end
    end


    def destroy 
        log_out!
        redirect_to new_session_url
    end
end