module ApplicationHelper
  def error_messages(instance,column)
    message_index = instance.errors.details.find_index {|key, value| key == column.to_sym}
    return if message_index.nil?
    message = instance.errors.full_messages[message_index]
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
end
