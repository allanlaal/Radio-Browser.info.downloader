#!/bin/bash

# Categories and their associated tags
declare -A categories=(
	#  ["Breakbeat"]="breakbeat,breakbeat hardcore,breakcore"
	#  ["Trap"]="chilled trap"
	#  ["Chiptune"]="chiptune,chiptunes"
	#  ["EDM"]="christian edm,edm,edm podcast,edm radioshows"
	#  ["House"]="tech #house,house,tech#house,house,filter #house,house,fidget house"
	#  ["DrumAndBass"]="dnb,d&b,d'n'b,drum and bass,jungle,jungle hardcore,neurofunk"
	#  ["Dub"]="dub,dubstep,post dubstep"
	#  ["Hardstyle"]="early hardstyle,euphoric hardstyle,hardstyle,hardstyle/handsup/edm,raw hardstyle"
	#  ["OtherElectronic"]="complextro,futurebass,gabber,gabberdisco,glitchy synthwave,gospel edm,grime,handsup! rave oldscool 90s 00s 10s trance #techno,techno,happy hardcore,hardstep,indie electronic,liquid funk,liquid trap,minimal electronica,modern electronic ambient,power electronics,ragga jungle,romanian trap,russian dance electronic pop hits radio,speedcore,synthesiser,synthwave"
	#  ["WorldAndEthnic"]="dancdhall,ethnic #house,house,narodna - mix - rap - trap"
	#  ["PopInfluencedElectronic"]="electro pop,electro swing,electroswing,eurodance,pop and electronic music from the late 70s and the 80s,pop dance eurodance"
	#  ["ExperimentalAndNiche"]="demoscene,experimental electronic music,experimental #techno,techno,idm"
	#  ["FestivalAndEvent"]="festival electro"

	["high_positive_high_energy"]="big room,festival #electro,electro,handsup! rave oldscool 90s 00s 10s trance #techno,techno,happy hardcore,hardstyle/handsup/edm,hyper#techno,techno,pumping #house,house,euphoric hardstyle,progressive trance"
	["high_positive_low_energy"]="chill #house,house,chilled trap,electro swing,electronic chill-out,future funk,jazzy #house,house,melodic #house,house,melodic house & #techno,techno,melodic trance,slow trance"
	["neutral_positive_high_energy"]="club dance electronic house trance,club #house,house,club house trance dance,club#house,house,dance,dance 80s,dance 90s,dance classics,dancefloor #house,house,#electro,electro,electro #house,house,electro latino,electropop,eurodance,funky #house,house,#house,house,house - electro - club music - #techno,techno,house #techno,techno,houseparty,progressive #house,house,tech #house,house,tech#house,house,#techno,techno,trance,trance house"
	["neutral_positive_low_energy"]="ambient #techno,techno,balearic #house,house,#electro,electro,electro-pop,electroindustrial,electronic deep,electronic music,indie #house,house,minimal electronica,minimal tech #house,house,minimal #techno,techno,modern electronic ambient,organic #house,house,soulful #house,house,synthwave"
#	["neutral_negative_high_energy"]="acid #house,house,acid-#house,house,complextro,dnb,d&b,d'n'b,demoscene,dubstep,#electro,electro,electro-industrial,garage #house,house,glitchy synthwave,grime,hard #techno,techno,hard trance,hard#techno,techno,idm,industrial #techno,techno,jungle,jungle hardcore,neurofunk,post dubstep,power electronics,raw hardstyle,raw #house,house,speedcore,technohard"
#	["neutral_negative_low_energy"]="#chillout,chillout,dark #electro,electro,dark #house,house,dark psytrance,dark #techno,techno,dark#techno,techno,dub #techno,techno,dub#techno,techno,experimental #techno,techno,forest psytrance,forestpsytrance,freeform psytrance,gabber,gabberdisco,goa trance,goa trance psychedelic trance,hardstep,hard#techno,techno,minimal #techno,techno,psy-trance,psychedelic trance,raw hardstyle,spugedelic trance,chillout"

	#  ["Chill_Positive"]="#chillout,chillout,ambient #techno,techno,balearic #house,house,chill #house,house,chilled trap,chill#house,house,electronic chill-out,modern electronic ambient"
	#  ["Dark_Energetic"]="#techno,techno,ambient #techno,techno,baumarkt#techno,techno,breakbeat hardcore,dark #electro,electro,dark #house,house,dark psytrance,dark #techno,techno,dark#techno,techno,deep #techno,techno,dub #techno,techno,dub#techno,techno,early hardstyle,electro #techno,techno,electroindustrial,euphoric hardstyle,experimental #techno,techno,gabber,gabberdisco,handsup! rave oldscool 90s 00s 10s trance #techno,techno,happy hardcore,hard #techno,techno,hard trance,hardstep,hardstyle,hardstyle/handsup/edm,hard#techno,techno,house - electro - club music - #techno,techno,house #techno,techno,hyper#techno,techno,industrial #techno,techno,jungle hardcore,melodic house & #techno,techno,melodic #techno,techno,minimal #techno,techno,raw hardstyle,#techno,techno,techno funk,techno; indie; electro; alternative,technohard,technoypi"
	#  ["High_Energy_Positive"]="big room,dancefloor #house,house,euphoric hardstyle,festival #electro,electro,happy hardcore,jump up,pumping house"
	#  ["Experimental_Cerebral"]="deep tech #house,house,deep #techno,techno,electro deep,electronic deep,experimental electronic music,experimental #techno,techno,glitchy synthwave,house/soulful/deep #house,house,idm,minimal electronica,minimal tech #house,house,minimal techno"
	#  ["EDM: Random"]="#electro,electro,#house,house,90s trance,acid #house,house,acid-#house,house,afro #house,house,bass #house,house,breakbeat,breakcore,chiptune,chiptunes,christian edm,club dance electronic house trance,club #house,house,club house trance dance,club#house,house,complextro,futurebass,dnb,d&b,d'n'b,dab+,dancdhall,dance,dance & electronic,dance & electronicdiscoeurodanceitalo-discopoptran,dance 80s,dance 90s,dance classics,dance house club  electronic tech#house,house,dance house club electronic tech#house,house,dance house club electronic trance 90s,demoscene,drum and bass,dub,dubstep,dutch #house,house,edm,edm podcast,edm radioshows,electro funk,electro hop,electro #house,house,electro latino,electro pop,electro rock,electro sets,electro swing,electrolatino,electronic,electronic beats,electronic dance music,electronic music,electronic rock,electronics,electropop,electroswing,ethnic #house,house,euro #house,house,eurodance,filter #house,house,fidget #house,house,forest psytrance,forestpsytrance,freeform psytrance,funky #house,house,future bass,future funk,future garage,future #house,house,garage #house,house,future garage,future #house,house,goa trance,goa trance psychedelic trance,gospel edm,grime,hip #house,house,#house,house,house music,houseparty,housetimehd-acc-,housetimelow,houseworld,indie electronic,indie #house,house,italo#house,house,jackin #house,house,jazzy #house,house,jungle,latin #house,house,liquid funk,liquid trap,melodic #house,house,melodic trance,music trance,narodna - mix - rap - trap,neurofunk,new york #house,house,non stop house sessions,norway #house,house,oldschool electro #house,house,organic #house,house,pop - house - dance,pop and electronic music from the late 70s and the 80s,pop dance eurodance,post dubstep,power electronics,prog-#house,house,progresive #house,house,progressive #house,house,progressive psytrance,progressive trance,psy-trance,psychedelic trance,pump #house,house,ragga jungle,raw #house,house,romanian trap,russian dance electronic pop hits radio,slap #house,house,slow trance,soulful #house,house,speedcore,spugedelic trance,synthesiser,synthwave,tech #house,house,tech#house,house,trance,trance #house,house,trancebase.fm,trancepulse,trancetechnic,trancetechnic radio,trance"

)

# note: LLM's always reformat input data AND Radio-Browser.info API fails if 1 tag is wrong, so it's best to make 1 query as small as possible

# get server list from http://de1.api.radio-browser.info/json/servers
servers=$(curl --silent http://de1.api.radio-browser.info/json/servers)
# TODO: round-robin servers

base_url="http://nl1.api.radio-browser.info/xml/stations/search?tagList="
#base_url="http://nl1.api.radio-browser.info/xml/stations/search?tagList="
# TODO: randomize API server urls

debug=0

for category in "${!categories[@]}"; do
	IFS=',' read -r -a tags_array <<<"${categories[$category]}"
	category_filename="stations.$category.m3u"
	touch "$category_filename"

	for tag in "${tags_array[@]}"; do
		#    echo "getting $category tag: $tag"
		url="$base_url${tag// /%20}"

		if [[ $debug -eq 1 ]]; then
			echo "GET: $url"
			echo ""
		fi

		stations=$(curl --silent --max-time 600 "$url" | grep -oP 'url_resolved="\K[^"]+') # grep is faster than xpath for this simple query

		#    echo "stations: $stations"

		if [ -n "$stations" ]; then
			readarray -t stations <<<"$stations"

			for station in "${stations[@]}"; do
				echo "testing station: $station"

				if grep -q "$station" "$category_filename"; then
					echo "SKIPPED existing: $station (already in $category_filename)"
					continue
				fi

				# do not use --head, most servers will not respond to HEAD requests
				status_code=$(curl --silent --output /dev/null --write-out "%{http_code}" --max-time 60 "$station") # NOTE: a lower timeout filters out slow servers too
				if [ "$status_code" == "200" ]; then
					echo "$station" >>"$category_filename"
					echo "$station WRITTEN"
				else
					echo "SKIPPED $station (status:$status_code)"
				fi
			done

		fi

		echo "Stations found thus far:"
		wc -l *.m3u
		echo "------------------------------------------"
		#		cat "$category_filename"
	done

done

echo "All done!"
dir -1 *.m3u
