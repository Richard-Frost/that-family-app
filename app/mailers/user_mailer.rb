class UserMailer < ApplicationMailer

  

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Autumn's Play Date Password Reset"
  end

  def family_invite(user)
    @user = user
    mail :to => user.email, :subject => "Autumn's Play Date Invite"
  end
end