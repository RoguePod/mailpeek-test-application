# frozen_string_literal: true

module Emails
  # Public: Sends Email
  class SendInteraction < ApplicationInteraction
    string :subject
    string :to
    string :from
    string :html, default: ''
    string :text, default: ''

    array :attachments, default: nil do
      file
    end

    def execute
      rendered = html_safe

      Emailer.email(
        rendered, text, attachments, subject: subject, to: to, from: from
      ).deliver_now
    end

    def html_safe
      return '' if html.blank?

      renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
      markdown = Redcarpet::Markdown.new(renderer)

      markdown.render(html)
    end
  end
end
