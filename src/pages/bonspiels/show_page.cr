class Bonspiels::ShowPage < MainLayout
  needs bonspiel : Bonspiel
  quick_def page_title, "Bonspiel with id: #{bonspiel.id}"

  def content
    link "Back to all Bonspiels", Bonspiels::Index, class: "link link-secondary"
    h1 "Bonspiel with id: #{bonspiel.id}"
    render_actions
    render_bonspiel_fields
    render_draws
  end

  def render_actions
    section do
      link "Edit", Bonspiels::Edit.with(bonspiel.id), class: "link"
      text " | "
      link "Delete",
        Bonspiels::Delete.with(bonspiel.id),
        data_confirm: "Are you sure?",
        class: "link link-secondary"
    end
  end

  def render_bonspiel_fields
    strong bonspiel.start_at.in(Time::Location.load("America/Chicago")).to_s
    text " to "
    strong bonspiel.end_at.in(Time::Location.load("America/Chicago")).to_s
  end

  def render_draws
    h3 "Create New Draw"
    form_for Draws::Create.with bonspiel_id: bonspiel.id do
      mount Shared::Field, SaveDraw.new.start_at, &.datetime_input(
        value: bonspiel.start_at.to_json.strip('"').strip("Z"),
        min: bonspiel.start_at.to_json.strip('"').strip("Z"),
        max: bonspiel.end_at.to_json.strip('"').strip("Z")
      )

      submit "Add Draw", data_disable_with: "Saving...", class: "btn btn-success"
    end

    ul do
      bonspiel.draws.each do |draw|
        li do
          link draw.to_s, to: ::Draws::Show.with(draw_id: draw.id), class: "link"
        end
      end
    end
  end
end
