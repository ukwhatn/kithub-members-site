module SessionsHelper
  def provider_class(provider)
    case provider
    when 'google' then
      return GoogleAccount
    when 'kindai' then
      return KindaiAccount
    when 'discord' then
      return DiscordAccount
    when 'github' then
      return GithubAccount
    end
    nil
  end

  def is_authenticated?
    current_user.present?
  end

  def authenticate_user!
    unless is_authenticated?
      redirect_to root_path
      return
    end
    if current_user.is_checked == false
      redirect_to register_path
      return
    else
      if current_user.is_approved == false
        redirect_to register_decline_path
        return
      end
    end
  end

  def admin?
    is_authenticated? && current_user.is_admin
  end

  def authenticate_admin!
    unless admin?
      redirect_to members_my_page_path
      return
    end
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def login(user)
    session[:user_id] = user.id
  end
end
