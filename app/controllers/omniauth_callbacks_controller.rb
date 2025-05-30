class OmniauthCallbacksController < ApplicationController
    def twitter

        existingUser=TwitterAccount.find_by(username: auth.info.nickname)

        if existingUser && existingUser.user_id != Current.user.id
            redirect_to twitter_accounts_path, alert: "This Twitter account is already connected."
            return
        end

     


        twitter_account=Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
        
        twitter_account.update(
            name: auth.info.name,
            username: auth.info.nickname,
            image: auth.info.image,
            token: auth.credentials.token,
            secret: auth.credentials.secret

        )


        redirect_to root_path, notice: "Twitter account successfully connected."
    end

    def auth
        request.env['omniauth.auth']
    end

end