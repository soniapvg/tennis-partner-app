class UserMailer < ApplicationMailer
  default from: "tennis-club-partner@yopmail.com"

    def welcome_email(user)
        #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
        @user = user 
    
        #on définit une variable @url qu'on utilisera dans la view d’e-mail
        if Rails.env.production?
          @url = 'https://tennis-club-partner.herokuapp.com/'
        elsif Rails.env.development?
          @url = 'http://localhost:3000'
        else
          @url = 'https://tennis-club-partner-staging.herokuapp.com/'
        end
    
        # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
        mail(to: @user.email, subject: 'Bienvenue chez nous !') 

      end

      def notification_email(receiver, sender, content)
        @receiver = receiver
        @sender = sender
        @content = content    
        #on définit une variable @url qu'on utilisera dans la view d’e-mail
          if Rails.env.production?
            @url = 'https://tennis-club-partner.herokuapp.com/'
          elsif Rails.env.development?
            @url = 'http://localhost:3000'
          else
            @url = 'https://tennis-club-partner-staging.herokuapp.com/'
          end
  
        # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
        mail(to: @receiver.email, subject: "#{@sender.first_name} t'a envoyé un message pour une partie de tennis !") 

      end

end