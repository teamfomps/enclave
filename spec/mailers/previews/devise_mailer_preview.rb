class Devise::MailerPreview < ActionMailer::Preview
  def confirmation_instrutions
    Devise::Mailer.confirmation_instructions(Member.first, 'bogus')
  end

  def reset_password_instructions
    Devise::Mailer.reset_password_instructions(Member.first, 'bogus')
  end

  def unlock_instructions
    Devise::Mailer.unlock_instructions(Member.first, 'bogus')
  end

  def password_change
    Devise::Mailer.password_change(Member.first)
  end
end
