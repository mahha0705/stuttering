module QuestionsHelper
  def check_box_judge(key)
    if params[:seacrh_sort].nil?
      return false
    elsif params[:seacrh_sort].include?(key)
      return true
    end
  end
end
