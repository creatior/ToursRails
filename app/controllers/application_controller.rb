class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  rescue_from ActiveRecord::ConnectionNotEstablished do |exception|
    flash[:alert] = "Database connection error: #{exception.message}"
    redirect_to root_path
  end

  rescue_from ActiveRecord::RecordNotFound, with: :render_404 do |exception|
    flash[:alert] = "Record not found: #{exception.message}"
  end

  rescue_from ActionController::RoutingError, with: :render_404 do |exception|
    flash[:alert] = "Page not found: #{exception.message}"
  end

  def render_404
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404.html", status: :not_found }
      format.all { render nothing: true, status: :not_found }
    end
  end
end
