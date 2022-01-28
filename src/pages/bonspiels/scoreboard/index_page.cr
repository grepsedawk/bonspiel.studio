class Bonspiels::Scoreboard::IndexPage < ScoreboardLayout
  needs game : Game
  quick_def :page_title, "Scoreboard"

  def content
    div class: "flex text-center" do
      div class: "btn-group flex-1 flex" do
        hammer_button if game.team_a_hammer?
        div game.team_a_name.to_s, class: "flex-1 btn btn-lg animate-none"
        div game.team_a_score.to_s, class: "btn btn-lg btn-error animate-none"
      end
      div "#{ordinal(game.current_end)} End", class: "btn btn-lg animate-none"
      div class: "btn-group flex-1 flex" do
        div game.team_b_score.to_s, class: "btn btn-lg btn-warning animate-none"
        div game.team_b_name.to_s, class: "flex-1 btn btn-lg animate-none"
        hammer_button if game.team_b_hammer?
      end
    end
  end

  def ordinal(number)
    if (11..13).includes?(number)
      "#{number}th"
    else
      case number % 10
      when 1; "#{number}st"
      when 2; "#{number}nd"
      when 3; "#{number}rd"
      else    "#{number}th"
      end
    end
  end

  private def hammer_button
    div class: "btn btn-lg fill-white animate-none" do
      tag "svg", height: "15.903", viewbox: "0 0 132.899 125.953", width: "16.78", xmlns: "http://www.w3.org/2000/svg", "xmlns:v": "https://vecta.io/nano" do
        tag "path", d: "M70.849 37.704l14.399 14.8-64.398 71.199c-2.8 3-7.8 3-10.8 0l-7.8-8c-3-2.8-3-7.8 0-10.8l68.599-67.199zm60.4 15.2l-10.8 11c-2.2 2.2-5.601 2.2-8 0l-2.4-2.6c-1.8-1.6-2.6-4.6-1.6-6 1.8-1.2 1.2-4.8-2.2-8-4.8-5-11-5.2-13.399-2.6-1 .8-4.2 4.2-4.2 4.2l-14.8-14.6 2.4-2.4s.6-.6 1.8-2c4.6-4.6-.2-9.8-.2-9.8-13-12.8-31.199-12.6-31.199-12.6l-.2-4.6c36.6-9.4 50.399 6.6 55.399 11.6l10.6 10.6c2.6 2.6 0 10 3.8 14.2 1.8 1.8 4.2 2.6 6 2.6 2-1.8 5.2-1.2 6.8.6l2.2 2.4c2.199 2.2 2.199 5.6-.001 8zm-505.467 61.6c5 5 4.8 13-.2 18.199-5.2 5-13.199 5-18.199-.199l-32.2-34-29.999 36.199c-2.8 3-7.8 3-10.8 0l-7.8-8c-3-2.799-3-7.799 0-10.799l34.399-32-16.6-16c-5.4-5.2-8.601-6.8-13-5.4-4.4 1.6-10.6 1.6-16.399-2.2-12.4-8-11.601-23-11.601-23l1-1.6 12.6 8c1.801 1.4 8 4.2 13.601-4.4 5.8-8.6 1-14-.601-15-1.399-.8-12.6-8.2-12.6-8.2l1-1.6s13-6.6 25.199.6c0 .4 3 2.2 4.2 3.2 7.8 7 7.8 14.8 6.4 21.2-1.2 5.8 0 7.8 4.6 12.8l16.6 16.6 19.8-20.2 14.399 14.8-18.999 19.4 35.2 31.6zm29.8-50.6l-10.8 11c-2.2 2.2-5.601 2.2-8 0l-2.4-2.6c-1.8-1.6-2.6-4.6-1.6-6 1.8-1.2 1.2-4.8-2.2-8-4.8-5-11-5.2-13.399-2.6-1 .8-4.2 4.2-4.2 4.2l-14.8-14.6 2.4-2.4s.6-.6 1.8-2c4.6-4.6-.2-9.8-.2-9.8-13-12.8-31.199-12.6-31.199-12.6l-.2-4.6c36.6-9.4 50.399 6.6 55.399 11.6l10.6 10.6c2.6 2.6 0 10 3.8 14.2 1.8 1.8 4.2 2.6 6 2.6 2-1.8 5.2-1.2 6.8.6l2.2 2.4c2.199 2.2 2.199 5.6-.001 8zm-34.399 54.799c-2.601-2.6-6.8-2.6-9.601 0-2.399 2.6-2.399 7 0 9.4 2.801 2.6 7 3 9.601.2 2.599-2.399 2.599-7 0-9.6z"
      end
    end
  end
end
