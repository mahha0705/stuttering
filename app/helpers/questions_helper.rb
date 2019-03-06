# frozen_string_literal: true

module QuestionsHelper
  def check_box_judge(key)
    if params[:seacrh_sort].nil?
      false
    elsif params[:seacrh_sort].include?(key)
      true
    end
  end
end
