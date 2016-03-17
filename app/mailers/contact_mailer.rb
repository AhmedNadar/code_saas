class ContactMailer < ApplicationMailer

   def welcome_email(name, email, body)
    @name = name
    @email = email
    @body = body
    mail(from: email, subject: 'Welcome to Code SaaS')
  end

end


