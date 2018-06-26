# frozen_string_literal: true

# Public: Emailer
class Emailer < ApplicationMailer
  def email(html, text, files, params)
    @html = html
    @text = text

    (files || []).each do |file|
      attachments[file.original_filename] = file.read
    end

    mail params do |format|
      format.html if @html.present?
      format.text if @text.present?
    end
  end
end
