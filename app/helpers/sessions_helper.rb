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
    session[:user_id].present?
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def login(user)
    session[:user_id] = user.id
  end
end
