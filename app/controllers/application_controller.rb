class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  　# deviseの機能が使われる前に、configure_permitted_parametersを実行

  　def after_sign_in_path_for(resource)
    about_path
  　end

  　def after_sign_out_path_for(resource)
    about_path
  　end

  　protected

  　def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:email])# sign_up時にユーザ名（+email）の操作を許可
  　end

end