class Bonspiels::NewPage < MainLayout
  needs operation : SaveBonspiel
  quick_def page_title, "New Bonspiel"

  def content
    h1 "New Bonspiel"
    render_bonspiel_form(operation)
  end

  def render_bonspiel_form(op)
    form_for Bonspiels::Create do
      mount Bonspiels::FormFields, op

      submit "Save", data_disable_with: "Saving...", class: "btn btn-success"
    end
  end
end
