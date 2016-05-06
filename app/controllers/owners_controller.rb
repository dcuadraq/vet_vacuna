class OwnersController < ApplicationController
  expose(:owner)
  expose(:owners)
  expose(:owner_presenter) { OwnerPresenter.new(owner) }
  expose(:owner_form) { OwnerForm.new(owner_params, owner: owner) }
  expose(:search_form) { SearchForm.new(search_params) }
  expose(:pets, ancestor: :owner)

  def index
    self.owners = Search::OwnerSearchService.new(search_form).search!
  end

  def show
  end

  def edit
  end

  def create
    respond_to do |format|
      if owner_form.save
        format.html { redirect_to owner_form.owner,
                      notice: 'Owner was successfully created.' }
        format.json { render :show, status: :created, location: owner }
      else
        format.html { render :new }
        format.json { render json: owner_form.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if owner.update(owner_params)
        format.html { redirect_to owner, notice: 'Owner was successfully updated.' }
        format.json { render :show, status: :ok, location: owner }
      else
        format.html { render :edit }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    owner.destroy
    respond_to do |format|
      format.html { redirect_to owners_url, notice: 'Owner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def owner_params
    return {} unless params[:owner].present?
    params.require(:owner).permit(:name, :lastname, :phone)
  end

  def search_params
    return {} unless params[:search].present?
    params.require(:search)
  end

end
