class RegistrationsController < Devise::RegistrationsController

    def new
        super
    end

    def create
        @user = User.new(divise_params)
        if @user.save
        redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
      
        @user = User.find(current_user.id)
    end

    def update
      
       if @user.update(divise_params)
         redirect_to root_path  
       else
       render :edit
       end
    end

    private
    def divise_params
        params.require(:user).permit(:email, :password, :password_confirmation, :avatar)
    end
end
