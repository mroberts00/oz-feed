class UserMailer < ApplicationMailer
    default from: 'roberts.mat00@gmail.com'
    def send_signup_email(donor)
        @donor = donor
        mail(to:@donor.email, subject: 'Successfully signed in')
    end
end
