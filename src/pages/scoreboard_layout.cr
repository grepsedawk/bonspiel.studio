abstract class ScoreboardLayout
  include Lucky::HTMLPage

  abstract def content
  abstract def page_title

  def render
    html_doctype

    html lang: "en", data_theme: "dark", class: "bg-transparent" do
      head do
        css_link asset("css/app.css")
        js_link asset("js/app.js"), defer: "true"
        empty_tag "meta", http_equiv: "refresh", content: "30"
      end
      body data_controller: "refresh" do
        main do
          content
        end
      end
    end
  end
end
