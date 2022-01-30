class Bonspiels::ShowPage < MainLayout
  needs bonspiel : Bonspiel
  quick_def page_title, "Bonspiel with id: #{bonspiel.id}"

  def content
    render_breadcrumbs
    div class: "grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6" do
      div class: "card shadow-2xl" do
        div class: "card-body" do
          h2 bonspiel.name, class: "card-title"
          h3 "Actions"
          render_actions
          render_bonspiel_fields
        end
      end
      div class: "card shadow-2xl" do
        div class: "card-body" do
          render_draws
        end
      end
      div class: "card shadow-2xl" do
        div class: "card-body" do
          render_stream_links
        end
      end
    end
  end

  def render_breadcrumbs
    mount Shared::Breadcrumbs do
      li do
        link "Bonspiels", Bonspiels::Index
      end
      li do
        link "Bonspiel: #{bonspiel.name}", Bonspiels::Show.with(bonspiel.id)
      end
    end
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
    h3 "Dates"
    para do
      strong bonspiel.start_at.in(Time::Location.load("America/Chicago")).to_s("%a %b %-d %Y")
      text " to "
      strong bonspiel.end_at.in(Time::Location.load("America/Chicago")).to_s("%a %b %-d %Y")
    end
    h3 "Sheets"
    para bonspiel.sheets
  end

  def render_stream_links
    h2 "Stream Links", class: "card-title"
    div do
      link "Scoreboard", Bonspiels::Scoreboard::Index.with(bonspiel), target: "_blank", class: "link"
    end
    div do
      link "Ticker", Bonspiels::Ticker::Index.with(bonspiel), target: "_blank", class: "link"
    end
  end

  def render_draws
    h2 "Draws", class: "card-title"
    h3 "Create New Draw"
    form_for Draws::Create.with bonspiel_id: bonspiel.id do
      div class: "relative max-w-xs" do
        datetime_input(
          SaveDraw.new.start_at,
          value: bonspiel.start_at.to_json.strip('"').strip("Z"),
          min: bonspiel.start_at.to_json.strip('"').strip("Z"),
          max: bonspiel.end_at.to_json.strip('"').strip("Z"),
          class: "w-full pr-16 input input-primary input-bordered"
        )
        submit "Add Draw", data_disable_with: "Saving...", class: "absolute top-0 right-0 rounded-l-none btn btn-primary"
      end
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
