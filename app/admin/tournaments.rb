ActiveAdmin.register Tournament do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :startgg_event_id, :startgg_tournament_id, :startgg_slug, :happened_at, :country_code, :state, :venue_name, :zipcode, :address, :is_online, :event_name, :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :startgg_event_id, :startgg_tournament_id, :startgg_slug, :happened_at, :country_code, :state, :venue_name, :zipcode, :address, :is_online, :event_name, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  filter :name
  filter :status
  filter :happened_at
  filter :country_code
  filter :state
  filter :zipcode
  filter :address
  filter :is_online
end
