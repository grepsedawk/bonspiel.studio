class Draws::Switcher < BaseComponent
  needs draw : Draw

  def render
    tag "turbo-frame", id: "draw-switcher" do
      div class: "btn-group" do
        previous_draw_button
        form_for Draws::Update.with(draw.id), data_controller: "autoSaveInput" do
          datetime_input(
            SaveDraw.new(draw).start_at,
            value: draw.start_at.in(Time::Location.load("America/Chicago")).to_s("%Y-%m-%dT%H:%M"),
            min: bonspiel.start_at.in(Time::Location.load("America/Chicago")).to_s("%Y-%m-%dT%H:%M"),
            max: bonspiel.end_at.in(Time::Location.load("America/Chicago")).to_s("%Y-%m-%dT%H:%M"),
            class: "w-full pr-16 input input-primary input-bordered",
            data_action: "change->autoSaveInput#submit"
          )
        end
        next_draw_button
      end
    end
  end

  def previous_draw_button
    if previous = draw.previous
      link "👈", Draws::Show.with(previous.id), class: "btn", target: "_top"
    else
      div class: "btn btn-disabled" { text "👈" }
    end
  end

  def next_draw_button
    if next_draw = draw.next
      link "👉", Draws::Show.with(next_draw.id), class: "btn", target: "_top"
    else
      div class: "btn btn-disabled" { text "👉" }
    end
  end

  def bonspiel : Bonspiel
    draw.bonspiel!
  end
end
