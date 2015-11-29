class AddMoreInfoInUsers < ActiveRecord::Migration
  def change
  	add_column	:users,	:fax,				:string
  	add_column	:users,	:secondary_email,	:string
  	add_column	:users,	:ntn,				:string
  	add_column	:users,	:refferal_id,			:integer
  	add_column	:users,	:social_media_links,	:text
  	add_column	:users,	:home_contact,		:text
  end
end
