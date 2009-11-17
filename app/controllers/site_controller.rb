class SiteController < ApplicationController
  layout 'site'
  
  # Displays main portfolio.
  def work
    @main_heading='<span>I</span> <span>build</span> <span>web</span> <span>sites</span><span class="punctuation">.</span>'
    @featured, @projects = Project.first_with_remainder
  end
  
  # Showcases a specific project.
  def spotlight
    @project = Project.find_by_guid(params[:guid])
    @main_heading = spanitize(@project.name)
    @assets = @project.assets
    @assets.shift
  end
  
  protected
  # Wraps content words in individual spans.
  def spanitize(content)
    content.split(" ").map { |s| "<span>#{s}</span>" }.join(" ")
  end
end