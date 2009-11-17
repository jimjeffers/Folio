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
    @main_heading = spanitize(@project.name)+" <span class=\"punctuation\">#{@project.completed_on.strftime("%Y")}</span>"
    @assets = @project.assets
    @assets.shift
  end
  
  # Displays about me page.
  def about
    @main_heading='<span>Hello</span> <span>my</span> <span>name</span> <span>is</span> <span>Jim</span><span class="punctuation">.</span>'
  end
  
  def inquire
    @main_heading='<span>Hire</span> <span>me</span><span class="punctuation">!</span>'
  end
  
  protected
  # Wraps content words in individual spans.
  def spanitize(content)
    content.split(" ").map { |s| "<span>#{s}</span>" }.join(" ")
  end
end