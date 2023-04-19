class SessionsController < ApplicationController
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
      session['auth'][provider] = model_class.new.set_value_from_omniauth(payload)
      redirect_to root_path
      return
    end

    session['auth'] = instance.user
    redirect_to root_path

  end

  def destroy
    redirect_to root_path
  end

  def not_found
  end
end
