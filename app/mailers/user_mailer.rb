class UserMailer < ApplicationMailer
  default from: "tennis-partner@yopmail.com"

    def welcome_email(user)
        #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
        @user = user 
    
        #on définit une variable @url qu'on utilisera dans la view d’e-mail
        @url  = 'www.tennis-partner.com' 
    
        # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
        mail(to: @user.email, subject: 'Bienvenue chez nous !') 

      end

      def invitation(receiver, sender, content)
        @receiver = receiver
        @sender = sender
        @content = content    
        #on définit une variable @url qu'on utilisera dans la view d’e-mail
        @url  = 'www.tennis-partner.com' 
  
        # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
        mail(to: @receiver.email, subject: "#{@sender.first_name} t'a envoyé une nouvelle proposition de partie de tennis !") 

      end

end