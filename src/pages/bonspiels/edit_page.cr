class Bonspiels::EditPage < MainLayout
  needs operation : SaveBonspiel
  needs bonspiel : Bonspiel
  quick_def page_title, "Edit Bonspiel with id: #{bonspiel.id}"

  def content
    render_breadcrumbs
    link "Back to all Bonspiels", Bonspiels::Index
    h1 "Edit Bonspiel with id: #{bonspiel.id}"
    render_bonspiel_form(operation)
  end

  def render_breadcrumbs
    mount Shared::Breadcrumbs do
      li do
        link "Bonspiel: #{bonspiel.name}", Bonspiels::Show.with(bonspiel.id)
      end
      li do
        link "Edit", Bonspiels::Edit.with(bonspiel.id)
      end
    end
  end

  def render_bonspiel_form(op)
    form_for Bonspiels::Update.with(bonspiel.id) do
      # Edit fields in src/components/bonspiels/form_fields.cr
      mount Bonspiels::FormFields, op

      submit "Update", data_disable_with: "Updating...", class: "btn btn-primary"
    end
  end
end
