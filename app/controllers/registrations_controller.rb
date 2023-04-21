class RegistrationsController < ApplicationController
  include SessionsHelper

  def new
    # OAuth2 callback後の遷移先をセット
    unless session['auth'].present?
      session['auth'] = {}
    end
    session['auth']['referer'] = register_path

    # ユーザデータオブジェクトを作成
    @user = User.new
    # 外部認証系データをセッションから取得
    @auth_data = build_auth_data
  end

  def create
    @user = User.new(user_params)
    @auth_data = build_auth_data

    # 外部認証系が充足しているか確認
    valid_auth_data = true
    if @user.graduated?
      if @auth_data['google'].nil?
        valid_auth_data = false
        @user.errors.add(:google, '既卒者の方は、Googleアカウントを登録してください(必須)')
      end

      if @auth_data['discord'].nil?
        valid_auth_data = false
        @user.errors.add(:discord, 'Discordアカウントを登録してください')
      end
    else
      if @auth_data['kindai'].nil?
        valid_auth_data = false
        @user.errors.add(:kindai, 'kindai.ac.jpアカウントを登録してください')
      end

      if @auth_data['discord'].nil?
        valid_auth_data = false
        @user.errors.add(:discord, 'Discordアカウントを登録してください')
      end
    end

    unless valid_auth_data
      render :new
      return
    end

    # トランザクション発行
    failed = false # トランザクション内でエラーが発生したかどうか
    User.transaction do
      if @user.save
        @auth_data.each do |_, data|
          data.transaction do
            data.user_id = @user.id
            unless data.save
              failed = true
              @user.errors.add(data.model_name, "#{data.model_name.human}の保存に失敗しました")
            end
          end
        end
      else
        failed = true
      end

      # トランザクション内でエラーが発生したらロールバック
      raise ActiveRecord::Rollback if failed
    end

    if failed
      render :new
      return
    end

    # トランザクションが正常終了したらリダイレクト
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(
      :name_last, :name_first, :name_last_kana, :name_first_kana,
      :student_id, :faculty_id, :department_id, :grade, :phone_number
    )
  end

  def build_auth_data
    auth_data = {}
    if session['auth'].present?
      session['auth'].each do |provider, data|
        cls = provider_class(provider)
        if cls.present?
          # 不正なOAuthが行われた場合はsessions_controllerでfalseが入っている
          if data == false
            case provider
            when "kindai" then
              @alerts.push("大学から発行されたメールアドレスを利用してください")
            when "google" then
              @alerts.push("kindai.ac.jpドメインのアドレスをGoogleアカウントとして登録することはできません")
            end
          else
            # 問題なければモデルを作成して格納
            auth_data[provider] = cls.new(data)
          end
        end
      end
    end

    auth_data
  end
end