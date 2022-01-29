abstract class ScoreboardLayout
  include Lucky::HTMLPage

  abstract def content
  abstract def page_title

  def refresh_time : Time::Span
    3.seconds
  end

  def render
    html_doctype

    html lang: "en", data_theme: "dark", class: "bg-transparent" do
      head do
        css_link asset("css/app.css")
        js_link asset("js/app.js"), defer: "true"
      end
      body data_controller: "refresh", data_refresh_interval_value: refresh_time.to_i * 1000 do
        main do
          content
        end
      end
    end
  end
end
