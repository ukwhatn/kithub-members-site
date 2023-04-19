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
end
