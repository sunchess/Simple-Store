require 'factory_girl_rails'

Factory.define :user do |u|
  u.sequence(:email) { |n| "person#{n}@cucumber.com" }
  u.password  "greenandjuicy"
  u.password_confirmation "greenandjuicy"
  u.role_mask 0
end

Factory.define :admin, :class => User do |u|
    u.email "admin@site.ru"
    u.password  "admin_user"
    u.password_confirmation "admin_user"
    u.role_mask 1
  end


Factory.define :group do |u|
  u.sequence(:name) { |n| "#{n}group" }
end

