module ApplicationHelper

  def error_messages(column)
    message_index = resource.errors.details.find_index {|key, value| key == column.to_sym}
    return if message_index.nil?
    message = resource.errors.full_messages[message_index]
    html = ""
    html += <<-EOF
    <div class="alert alert-warning alert-dismissible mt-1" role="alert">
      <button type="button" class="close" data-dismiss="alert">
        <span aria-hidden="true">&times;</span>
        <span class="sr-only">close</span>
      </button>
      #{message}
    </div>
    EOF
    html.html_safe
  end

  def error_messages(user,column)
    message_index = user.errors.details.find_index {|key, value| key == column.to_sym}
    return if message_index.nil?
    message = user.errors.full_messages[message_index]
    html = ""
    html += <<-EOF
    <div class="alert alert-warning alert-dismissible mt-1" role="alert">
      <button type="button" class="close" data-dismiss="alert">
        <span aria-hidden="true">&times;</span>
        <span class="sr-only">close</span>
      </button>
      #{message}
    </div>
    EOF
    html.html_safe
  end

  def question_error_messages(question,column)
    message_index = question.errors.details.find_index {|key, value| key == column.to_sym}
    return if message_index.nil?
    message = question.errors.full_messages[message_index]
    html = ""
    html += <<-EOF
    <div class="alert alert-warning alert-dismissible mt-1" role="alert">
      <button type="button" class="close" data-dismiss="alert">
        <span aria-hidden="true">&times;</span>
        <span class="sr-only">close</span>
      </button>
      #{message}
    </div>
    EOF
    html.html_safe
  end

  def form(qt,k,v,genre=[])
     form = ""
     form += <<-EOF
       #{qt.label :tag, v}
       #{qt.check_box(:tag,{:checked=> genre.include?(k)? true : false}, k ,false)}
     EOF
     form.html_safe
   end

end
