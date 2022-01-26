abstract class ScoreboardLayout
  include Lucky::HTMLPage

  # 'needs current_user : User' makes it so that the current_user
  # is always required for pages using MainLayout
  needs current_user : User

  abstract def content
  abstract def page_title

  def render
    html_doctype

    html lang: "en", data_theme: "wireframe" do
      head do
        css_link asset("css/app.css")
        js_link asset("js/app.js"), defer: "true"
      end
      body do
        main do
          content
        end
      end
    end
  end
end
