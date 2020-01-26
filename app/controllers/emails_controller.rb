# frozen_string_literal: true

# Public: EmailsController
class EmailsController < ApplicationController
  def new
    n = rand(1..5)

    data = {
      subject: Faker::Lorem.sentence,
      to: Faker::Internet.email,
      from: Faker::Internet.email,
      html: Faker::Markdown.random,
      text: Faker::Lorem.paragraphs(number: n).join("\r\n\r\n")
    }

    @form = Emails::SendInteraction.new(data)
  end

  def create
    @form = Emails::SendInteraction.run(create_params)

    if @form.valid?
      redirect_to root_path, notice: 'Email Sent'
    else
      render :new
    end
  end

  private

  def create_params
    params.require(:email)
          .permit(:to, :from, :subject, :html, :text, attachments: [])
  end
end
