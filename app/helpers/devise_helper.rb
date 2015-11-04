module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="alert alert-danger col-md-12"><a href="#"class="close" data-dismiss="alert">&#215;</a>
      Please correct the folowing errors:
       #{messages}
    </div>
    HTML

    html.html_safe
  end
end