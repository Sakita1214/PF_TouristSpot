# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def after_sign_in_path_for(resource)
    users_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

 protected

  def reject_user
    # 退会しているかを判断するメソッド
    @user = User.find_by(name: params[:user][:name])
    # 【処理内容1】 入力されたemailからアカウントを1件取得
    if @user
      if @user.valid_password?(params[:user][:password]) && (@user.id_deleted == false)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_user_registration
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

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
