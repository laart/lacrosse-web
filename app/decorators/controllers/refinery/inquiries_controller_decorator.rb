Refinery::Inquiries::InquiriesController.class_eval do

	before_filter :find_manager_contacts

  def find_manager_contacts
      @manager_contacts = Refinery::Managers::Manager.where(:in_contatcs => true)   
  end

end