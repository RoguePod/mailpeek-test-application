# Public: Emailer
class Emailer < ApplicationMailer
  def email(params)
    @body        = params[:body]
    content_type = params[:content_type]

    mail params do |format|
      format.html if content_type.blank? || content_type == 'text/html'
      format.text if content_type.blank? || content_type == 'text/plain'
    end
  end
end
