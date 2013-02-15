
class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :allowed_device?


  private

  Browser = Struct.new(:platform, :browser, :version)
  #  not this is the minium browser we accept
  SupportedBrowser = [ Browser.new("iPhone", "Safari", "5.0") ,
                       Browser.new("iPod","Safari", "4.0")]
                       # Browser.new("X11","Chrome", "24")]

  def allowed_device?
    user_agent = UserAgent.parse(request.user_agent)
    logger.info "UserAgent Platform " + user_agent.platform
    SupportedBrowser.detect {|browser| user_agent.platform == browser.platform}
  end

end
