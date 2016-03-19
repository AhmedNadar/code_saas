class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :only_current_user

  def new
    @user    = User.find(params[:user_id])
    @profile = Profile.new
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

  def edit
    @user    = User.find(params[:user_id])
    @profile = @user.profile
  end

  def update
    @user    = User.find(params[:user_id])
    @profile = @user.profile
    if @profile.update_attributes(profile_params)
      flash[:success] = "Your profile is been updated."
      redirect_to user_path(params[:user_id])
    else
      flash[:notice] = "Your profile needs attention."
      render 'edit'
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :job_title, :description, :phone_number, :contact_email, :location )
    end

    def only_current_user
      @user = User.find(params[:user_id])
      redirect_to root_url unless @user == current_user
    end
end