class Contact < MailForm::Base

  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,  :captcha  => true
  
  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Something cool spotted in Calgary",
      :to => "laurie@creativecalgary.ca",
      :from => %("#{name}" <#{email}>)
    }
  end
end
