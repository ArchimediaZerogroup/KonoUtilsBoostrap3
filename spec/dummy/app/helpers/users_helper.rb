module UsersHelper

  def editing_form_print_field(form,field)
    case field
    when :bio
      content_tag :span,'ciao'
    else
      super
    end
  end

end