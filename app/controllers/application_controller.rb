class ApplicationController < ActionController::Base
    protect_from_forgery prepend: true
#   protect_from_forgery with: :exception, unless: :json_request?

  protected

  def json_request?
    request.format.json?
  end
end
