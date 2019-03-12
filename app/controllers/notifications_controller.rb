# frozen_string_literal: true

class NotificationsController < ApplicationController
  def link_through
    @notification = Notification.find(params[:id])
    @notification.update read: true
    redirect_to question_path @notification.question
  end
end
