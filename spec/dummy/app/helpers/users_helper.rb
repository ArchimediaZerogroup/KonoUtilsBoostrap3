module UsersHelper

  def editing_form_print_field(form, field)
    case field
    when :birthdate
      form.input field, as: :bs_datepicker, :inject_js => true
    else
      super
    end
  end


  def edit_button(path)
    link_to fa_icon("pencil fw marino", text: "Override Helper"), path, class: 'btn btn-primary btn-xl'
  end

end