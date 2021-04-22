class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana,:birth_day])
  end
end

      # t.string :nickname, null: false
      # t.string :last_name, null: false
      # t.string :first_name, null: false
      # t.string :last_name_kana, null: false
      # t.string :first_name_kana, null: false
      # t.date :birth_day, null: false