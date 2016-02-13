# Public: EmailsController
class EmailsController < ApplicationController
  def create
    Emailer.email(create_params).deliver_now

    head :ok
  end

  private

  def create_params
    params.permit(:to, :from, :subject, :body, :content_type)
  end
end
