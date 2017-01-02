class Teachers::RegistrationsController < Devise::RegistrationsController
  include Accessible

  before_action :check_user, only: [:new]
  before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
    TeacherMailer.welcome_email(resource).deliver_later unless resource.invalid?
    SystemMailer.teacher_applied_email(resource).deliver_later unless resource.invalid?
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(
        :sign_up,
        keys: [
          :first_name, :last_name, :phone, :major,
          :degree, :student, :teaching_experience,
          :certificate, :mandarin, :referral,
          :internationalization_experience, :time_zone,
          :age_range, :gender, :speech_video, :resume
        ]
      )
    end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end