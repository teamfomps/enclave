class ProfilesController < AuthenticatedController
  before_action :find_profile

  def show
    redirect_to edit_profile_path
  end

  def update
    # Operate on a copy
    @profile = Member.to_adapter.get!(@profile.to_key)


    if profile_params['password'].empty?
      success = @profile.update_without_password(profile_params)
    else
      success = @profile.update(profile_params)
    end

    if success
      bypass_sign_in @profile # don't force the user to sign in again
      redirect_to member_path(@profile)
    else
      render 'edit'
    end
  end

  private

  def find_profile
    @profile = current_member
  end

  def profile_params
    params.require(:member).permit(:first_name, :last_name, :mobile_number,
                                   :password, :password_confirmation, :email,
                                   :receives_email_notifications,
                                   :receives_sms_notifications)
  end
end
