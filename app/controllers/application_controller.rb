class ApplicationController < ActionController::Base
  include Response
  protect_from_forgery unless: -> { request.format.json? }
  include SessionsHelper
end
