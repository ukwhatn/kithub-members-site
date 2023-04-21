class SessionsController < ApplicationController
  before_action :reset_callback_referer, only: [:not_found]
  include SessionsHelper

  def create
    # 認証情報取得
    payload = request.env['omniauth.auth']
    uid = payload.uid
    provider = payload.provider

    # idpごとのモデルを取得
    model_class = provider_class(provider)

    # 非対応モデルだったらrootにリダイレクト
    if model_class.nil?
      logger.error "not found provider: #{provider}"
      redirect_to root_path
      return
    end

    # ユーザーが存在するか確認
    instance = model_class.find_by(id: uid)

    if instance.nil?
      # 存在しなかったらクラスを作って保存せずにセッションに格納
      if session['auth'].nil?
        session['auth'] = {}
      end
      obj = model_class.new.set_value_from_omniauth(payload)
      if obj.nil?
        session['auth'][provider] = false
      else
        session['auth'][provider] = obj
      end

      if session['auth']['referer'].present?
        redirect_to session['auth']['referer']
      else
        redirect_to auth_not_found_path
      end
      return
    end

    login(instance.user)
    redirect_to members_my_page_path

  end

  def destroy
    reset_session
    redirect_to root_path
  end

  def not_found
  end

  def destroy_auth
    provider = params[:provider]
    if session['auth'].present? && session['auth'][provider].present?
      session['auth'].delete(provider)
    end
    redirect_to request.referer, status: :see_other
  end
end
