class PrimaryMailer < ActionMailer::Base
  default from: "Bitcamp <bitcamp@bitca.mp>"

  def preregister(email, name)
  	content = '<h1> Hi ' + name + ', </h1><p> Thanks for your interest in Bitcamp! We will be following up soon for further registration information. </p><p> In the meantime, join the <a href="https://twitter.com/search?q=%23plustech">#plustech conversation on Twitter</a>! </p><p> Please email kunal@bitca.mp if you have any questions. </p><hr><p> Hack on, <br>Bitcamp Team </p>' 
  	mail(to: email, body: content, 
  		content_type: "text/html", subject: "Permission Slip Received!")
  end
end
