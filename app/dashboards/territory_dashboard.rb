require "administrate/base_dashboard"

class TerritoryDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    player: Field::BelongsTo,
    id: Field::Number,
    coords: Field::String,
    time: Field::String,
    center_lng: Field::Number.with_options(decimals: 2),
    center_lat: Field::Number.with_options(decimals: 2),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    area: Field::Number.with_options(decimals: 2),
    username: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :player,
    :id,
    :coords,
    :time,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :player,
    :id,
    :coords,
    :time,
    :center_lng,
    :center_lat,
    :created_at,
    :updated_at,
    :area,
    :username,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :player,
    :coords,
    :time,
    :center_lng,
    :center_lat,
    :area,
    :username,
  ].freeze

  # Overwrite this method to customize how territories are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(territory)
  #   "Territory ##{territory.id}"
  # end
end
