class EmailsController < ApplicationController
  def send_email
    byebug
    flash.success = "Thanks for your interest. We will contact you shortly."
    redirect_to '/sign_in', notice:"hey"
  end
end
