class Shared::LayoutHead < BaseComponent
  needs page_title : String

  def render
    head do
      utf8_charset
      title "#{Application.settings.name} - #{@page_title}"
      css_link asset("css/app.css")
      js_link asset("js/app.js"), defer: "true"
      mount Shared::GoogleAnalytics, id: ENV.fetch("GOOGLE_ANALYTICS_ID") if LuckyEnv.production?
      csrf_meta_tags
      responsive_meta_tag
    end
  end
end
