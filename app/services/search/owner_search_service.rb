class Search::OwnerSearchService

  attr_accessor :form, :search

  def initialize(search_form)
    self.form = search_form
    self.search = Owner.all
  end

  def search!
    filter_name if form.name.present?
    filter_lastname if form.lastname.present?
    filter_phone if form.phone.present?
    search
  end

  private

  def filter_name
    self.search = search.where('owners.name like ?', "%#{ form.name.presence }%")
  end

  def filter_lastname
    self.search = search.where('owners.lastname like ?', "%#{ form.lastname.presence }%")
  end

  def filter_phone
    self.search = search.where('owners.phone like ?',"%#{ form.phone.presence }%")
  end

end
