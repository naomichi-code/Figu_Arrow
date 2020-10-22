class InquliesMailer < ApplicationMailer
  default :from => "Figu-Arrow.com"

  def inqulies_mail(inqulies)
    @inqulies = inqulies
    mail to: ENV["INQULY_MAIL"], subject: "FiguArrow お問い合わせ内容"
  end
end
