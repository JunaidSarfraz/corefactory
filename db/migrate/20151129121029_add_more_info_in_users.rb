class AddMoreInfoInUsers < ActiveRecord::Migration
  def change
  	add_column	:users,	:fax,				:string rescue puts "column already added"
  	add_column	:users,	:secondary_email,	:string rescue puts "column already added"
  	add_column	:users,	:ntn,				:string rescue puts "column already added"
  	add_column	:users,	:refferal_id,			:integer rescue puts "column already added"
  	add_column	:users,	:social_media_links,	:text rescue puts "column already added"
  	add_column	:users,	:home_contact,		:text rescue puts "column already added"
  end
end
