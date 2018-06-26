# frozen_string_literal: true

# Public: Controller for static pages
class StaticController < ApplicationController
  def index
    redirect_to new_email_path
  end
end
