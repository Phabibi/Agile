require "administrate/base_dashboard"

class PlayerDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    territory: Field::HasMany,
    id: Field::Number,
    first_name: Field::String,
    email: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    last_name: Field::String,
    password: Field::String,
    admin: Field::Boolean,
    username: Field::String,
    remember_digest: Field::String,
    score: Field::Number.with_options(decimals: 2),
    rank: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
    COLLECTION_ATTRIBUTES = [
    :id,
    :first_name,
    :last_name,
    :email,
    :rank,
    :score,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :territory,
    :id,
    :first_name,
    :email,
    :created_at,
    :updated_at,
    :last_name,
    :password,
    :admin,
    :username,
    :remember_digest,
    :score,
    :rank,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :territory,
    :first_name,
    :email,
    :last_name,
    :password,
    :admin,
    :username,
    :remember_digest,
    :score,
    :rank,
  ].freeze

  # Overwrite this method to customize how players are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(player)
  #   "Player ##{player.id}"
  # end
end
