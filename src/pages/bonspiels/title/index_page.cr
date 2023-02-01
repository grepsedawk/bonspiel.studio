class Bonspiels::Title::IndexPage < ScoreboardLayout
  needs bonspiel_name : String
  quick_def :refresh_time, 1.minute

  def content
    div class: "space-y-3 opacity-80" do
      div bonspiel_name, class: "btn"
    end
  end
end
