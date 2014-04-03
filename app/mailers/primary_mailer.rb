class PrimaryMailer < ActionMailer::Base
    default from: "Bitcamp <bitcamp@bitca.mp>"

    def preregister(email, name)
        content = '<h1> Hi ' + name + ', </h1><p> Thanks for your interest in Bitcamp! We will be following up soon for further registration information. </p><p> In the meantime, join the <a href="https://twitter.com/search?q=%23plustech">#plustech conversation on Twitter</a>! </p><p> Please email kunal@bitca.mp if you have any questions. </p><hr><p> Hack on, <br>Bitcamp Team </p>' 
        mail(to: email, body: content, 
             content_type: "text/html", subject: "Permission Slip Received!")
    end

    def registration(email, token)
        content = '<h1>Hey!</h1><p>Bitcamp Waiver</p><p><a href="https://bitca.mp/api/viewform?token=' + token + '&email=' + email + '">Click here</a> to confirm your email and continue the registration process.</p> Please email hello@bitca.mp if you have any questions. </p><hr><p> Hack on, <br>Bitcamp Team </p>' 
        mail(to: email, body: content, 
             content_type: "text/html", subject: "Confirm Bitca.mp Email")
    end

    def reset(email, token)
        content = '<h1>Hey!</h1><p> Your Bitca.mp account password has been successfully reset!</p><p><a href="https://bitca.mp/login/reset?token=' + token + '">Click here</a> to confirm your email and continue the registration process.</p> Please email hello@bitca.mp if you have any questions. </p><hr><p> Hack on, <br>Bitcamp Team </p>' 
        mail(to: email, body: content, 
             content_type: "text/html", subject: "Bitca.mp Password Reset")
    end

    def waiver(email)
        content = '<p>Hi Bitcamper!</p><p>Thanks for signing your waiver. You are 100% confirmed as a registered participant of Bitcamp. Find travel information at bitca.mp/travel. </p><p>See you by the bonfire--check-in starts at 4 PM. </p><p>Thanks, The Bitcamp Team </p>'
        mail(to: email, body: content, 
             content_type: "text/html", subject: "See you at Bitcamp!")
    end

end     


