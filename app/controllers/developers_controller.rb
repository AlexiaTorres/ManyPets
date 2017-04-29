class DevelopersController < ApplicationController
  helper_method :developer, :developers

  def index; end

  def show; end

  def edit; end

  def create
    save_or_render(:new, :created)
  end

  def update
    save_or_render(:edit, :updated)
  end

  def destroy
    developer.destroy!
    flash_and_redirect :deleted
  end

  private

  def flash_and_redirect(msg)
    flash[:notice] = "Developer #{developer.name} has been #{msg}"
    redirect_to developers_path
  end

  def save_or_render(action, msg)
    if developer.update_attributes(developer_params)
      flash_and_redirect msg
    else
      render action
    end
  end

  def developer_params
    @developer_params ||= params
                          .require(:developer)
                          .permit(:first_name, :last_name, :email, :pet)
  end

  def developer
    @developer ||= Developer.find_or_initialize_by(id: params[:id])
  end

  def developers
    @developers ||= Developer.all
  end
end
