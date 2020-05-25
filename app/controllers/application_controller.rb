class ApplicationController < ActionController::Base
  config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.test_framework false
    end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, ])
    #deviseにて使用できるdevise_parameter_sanitizerのpermitメソッドがストロングパラメーターにあたる
    #上記ではサインアップ時に入力されたnicknameキーの内容の保存を許可している
  end
end
