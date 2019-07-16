module UsersHelper

  def editing_form_print_field(form, field)
    case field
    when :birthdate
      form.input field, as: :bs_datepicker, :inject_js => true
    else
      super
    end
  end

end