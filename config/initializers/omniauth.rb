# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  # google
  ## ref: https://zenn.dev/batacon/articles/e9b4a88ede2889#7%2F7

  ### hd(ドメイン)に関係なくログインするとき
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'],
           {
             name: 'google',
             prompt: 'select_account',
             image_aspect_ratio: 'square'
           }

  ### kindai.ac.jpでログインさせたいとき
  #### 偽装リクエスト対策として、レスポンスデータのhdをチェックするのを忘れずに
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'],
           {
             name: 'kindai',
             prompt: 'select_account',
             image_aspect_ratio: 'square',
             hd: 'kindai.ac.jp'
           }

  # discord
  provider :discord, ENV['DISCORD_CLIENT_ID'], ENV['DISCORD_CLIENT_SECRET'], scope: 'email identify'

  # github
  provider :github, ENV['GITHUB_CLIENT_ID'], ENV['GITHUB_CLIENT_SECRET']
end

OmniAuth.config.allowed_request_methods = %i[get]
