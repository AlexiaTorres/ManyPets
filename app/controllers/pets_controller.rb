class PetsController < ApplicationController
  helper_method :developer, :pet

  def show; end

  def new
    return unless developer.pets_limit_reached?

    flash[:error] = 'Pet limit reached, please upgrade to premium plan'
    redirect_to developer_path(developer)
  end

  def edit; end

  def create
    save_or_render(:new, :created)
  end

  def update
    save_or_render(:edit, :updated)
  end

  private

  def save_or_render(action, msg)
    if pet.update_attributes(pet_params)
      flash_and_redirect msg
    else
      render action
    end
  end

  def flash_and_redirect(msg)
    flash[:notice] = "Pet #{pet.name} owned by #{developer.name} was #{msg}"
    redirect_to developer_path(developer)
  end

  def developer
    @developer ||= Developer.find(params[:developer_id])
  end

  def pet
    @pet ||= Pet.find_or_initialize_by(id: params[:id])
  end

  def pet_params
    @pet_params = params
                  .require(:pet).permit(:name, :age, :gender, :category, :alive)
                  .merge('developer_id': developer.id)
  end
end
