class Staffs::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    staff = Staff.find_by_user_name(sign_in_params[:user_name].downcase)
    if  staff && staff.valid_password?(sign_in_params[:password])
      sign_in(:staff, staff)
      redirect_to  root and return
    elsif staff && !staff.valid_password?(sign_in_params[:password])
      flash[:alert] = "The email and password you entered don't match."
      redirect_to  new_staff_session_path and return
    else
      flash[:alert] = "Sorry, We doesn't recognize that email."
      redirect_to  new_staff_session_path and return
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
