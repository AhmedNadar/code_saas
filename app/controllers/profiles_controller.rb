class ProfilesController < ApplicationController
  def new
    @user    = User.find(params[:user_id])
    @profile = @user.build_profile
  end

  def create
    @user    = User.find(params[:user_id])
    @profile = @user.build_profile(profile_params)

    if @profile.save
      flash[:success] = "Your profile is been created."
      redirect_to user_path(params[:user_id])
    else
      flash[:ganger] = "You are missing some info, please try again..."
      render action: :new
    end
  end


  private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :job_title, :description, :phone_number, :location )
    end
end