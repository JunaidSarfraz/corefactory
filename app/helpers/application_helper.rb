module ApplicationHelper

	def get_pakistan_cities
		return [ 
			'Karachi',
			'Lahore',
			'Faisalabad',
			'Rawalpindi',
			'Multan',
			'Gujranwala',
			'Hyderabad',
			'Peshawar',
			'Islamabad',
			'Quetta',
			'Sargodha',
			'Sialkot',
			'Bahawalpur',
			'Sukkur',
			'Jhang',
			'Shekhupura',
			'Mardan',
			'Gujrat',
			'Larkana',
			'Kasur',
			'RYK',
			'Sahiwal',
			'Okara',
			'Wah Cant.',
			'DGK',
			'Mingora',
			'Mirpur Khas',
			'Chiniot',
			'Nawabshah',
			'Kamoke',
			'Burewala',
			'Jhelum',
			'Sadiqabad',
			'Khanewal',
			'Hafizabad',
			'Kohat',
			'Jacobabad',
			'Shikarpu',
			'Muzaffargarh',
			'Khanpur',
			'Gojra',
			'Bahawalnagar',
			'Abbottabad',
			'Muridke',
			'Pakpattan',
			'Khuzdar',
			'Jaranwala',
			'Chishtian',
			'Daska',
			'Mandi Bahauddin',
			'Ahmadpur East',
			'Kamalia',
			'Tando Adam',
			'Khairpur',
			'DIK',
			'Vehari',
			'Nowshera',
			'Dadu',
			'Wazirabad',
			'Khushab',
			'Charsada',
			'Swabi',
			'Chakwal',
			'Mianwali',
			'Tando Allahyar',
			'Kot Adu',
			'Turbat',
		]
	end

	def get_pakistan_states
		return ['Punjab', 'Sindh', 'KPK', 'Balochistan', 'AJK']
	end
	
	def get_active_classes key, value
		# we can return open as class if we want to open the accordion
		value.include?(key) ? "start active" : ""
	end
	def flash_messsage_type_for flash_type
	    case flash_type
	      when :success, :notice, 'success', 'notice'
	        'success'
	      when :error, :alert, 'error', 'alert'
	        'danger'
	      else
	        'success'
	    end
  	end
end
