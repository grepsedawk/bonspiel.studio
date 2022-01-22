class Bonspiels::ShowPage < MainLayout
  needs bonspiel : Bonspiel
  quick_def page_title, "Bonspiel with id: #{bonspiel.id}"

  def content
    link "Back to all Bonspiels", Bonspiels::Index
    h1 "Bonspiel with id: #{bonspiel.id}"
    render_actions
    render_bonspiel_fields
  end

  def render_actions
    section do
      link "Edit", Bonspiels::Edit.with(bonspiel.id)
      text " | "
      link "Delete",
        Bonspiels::Delete.with(bonspiel.id),
        data_confirm: "Are you sure?"
    end
  end

  def render_bonspiel_fields
    ul do
      li do
        text "start_at: "
        strong bonspiel.start_at.to_s
      end
      li do
        text "end_at: "
        strong bonspiel.end_at.to_s
      end
    end
  end
end
