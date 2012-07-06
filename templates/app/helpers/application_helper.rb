module ApplicationHelper
  def page_title(title = nil)
    title ||= content_for :title if content_for(:title).present?

    title || Rails.application.class.parent_name
    # title || "MyApp.com"
    # (title ? "#{title} - " : "") << "MyApp.com"
  end
end
