package com.klu.TMS;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ControllerProject {
	

    @GetMapping("/home")
    public String home() {
        return "home"; 
    }
	

    @GetMapping("/localGuides") 
    public String localGuides() { 
     return "localGuides"; 
      
    } 
     
    @GetMapping("/tourDetails") 
    public String tourDetails() { 
     return "tourDetails"; 
      
    }
    
    @GetMapping("/tourDetails2") 
    public String tourDetails2() { 
     return "tourDetails2"; 
      
    }
    
    @GetMapping("/tourDetails3") 
    public String tourDetails3() { 
     return "tourDetails3"; 
      
    }

	@GetMapping("/explore")
	public String explore(Model model) {
	    List<Map<String, String>> countries = new ArrayList<>();
	    
	    Map<String, String> cnt1 = new HashMap<>();
	    cnt1.put("name", "India");
	    cnt1.put("image", "india.jpg");
	    countries.add(cnt1);

	    Map<String, String> cnt2 = new HashMap<>();
	    cnt2.put("name", "France");
	    cnt2.put("image", "france.jpeg");
	    countries.add(cnt2);

	    Map<String, String> cnt3 = new HashMap<>();
	    cnt3.put("name", "Japan");
	    cnt3.put("image", "japan.avif");
	    countries.add(cnt3);

	    Map<String, String> cnt4 = new HashMap<>();
	    cnt4.put("name", "USA");
	    cnt4.put("image", "usa.jpeg");
	    countries.add(cnt4);

	    Map<String, String> cnt5 = new HashMap<>();
	    cnt5.put("name", "Italy");
	    cnt5.put("image", "italy.jpg");
	    countries.add(cnt5);

	    Map<String, String> cnt6 = new HashMap<>();
	    cnt6.put("name", "Australia");
	    cnt6.put("image", "australia.jpeg");
	    countries.add(cnt6);

	    Map<String, String> cnt7 = new HashMap<>();
	    cnt7.put("name", "Brazil");
	    cnt7.put("image", "brazil.jpeg");
	    countries.add(cnt7);

	    model.addAttribute("countries", countries);
	    return "explore";
	}

	
	@GetMapping("/explore/country")
	public String countryDetails(@RequestParam("country") String countryName, Model model) {
	    List<Map<String, String>> places = new ArrayList<>();
	    
	    
	    switch (countryName) {
	        case "India":
	            places.add(Map.of("name", "Taj Mahal", "image", "tajmahal.jpeg", "description", "A beautiful ivory-white marble mausoleum in Agra."));
	            places.add(Map.of("name", "Jaipur City Palace", "image", "jaipur.jpeg", "description", "A blend of Mughal and Rajput architecture in Jaipur."));
	            places.add(Map.of("name", "Kerala Backwaters", "image", "kerala.jpeg", "description", "A network of brackish lagoons and lakes along Kerala."));
	            places.add(Map.of("name", "Goa Beaches", "image", "goa.jpg", "description", "Famous for its beaches and nightlife."));
	            places.add(Map.of("name", "Himalayas", "image", "himalayas.jpg", "description", "The majestic mountain range in Northern India."));
	            break;

	        case "France":
	            places.add(Map.of("name", "Eiffel Tower", "image", "eiffel.jpg", "description", "A wrought-iron lattice tower in Paris, one of the most recognizable structures in the world."));
	            places.add(Map.of("name", "Louvre Museum", "image", "louvre.jpg", "description", "The world's largest art museum and a historic monument in Paris."));
	            places.add(Map.of("name", "Mont Saint-Michel", "image", "mont_saint_michel.jpg", "description", "A small rocky island in Normandy with a stunning medieval abbey."));
	            places.add(Map.of("name", "French Riviera", "image", "riviera.webp", "description", "A popular coastal area known for its beautiful beaches and glamorous lifestyle."));
	            places.add(Map.of("name", "Palace of Versailles", "image", "versailles.jpeg", "description", "A magnificent palace near Paris known for its opulent architecture and gardens."));
	            break;

	        case "Japan":
	            places.add(Map.of("name", "Mount Fuji", "image", "fuji.jpg", "description", "Japan's tallest peak and an iconic symbol of the country."));
	            places.add(Map.of("name", "Kyoto Temples", "image", "kyoto_temple.avif", "description", "Ancient temples and gardens in the historic city of Kyoto."));
	            places.add(Map.of("name", "Tokyo Tower", "image", "tokyo_tower.jpg", "description", "A communications and observation tower in the Shiba-koen district."));
	            places.add(Map.of("name", "Arashiyama Bamboo Forest", "image", "bamboo_forest.jpg", "description", "A scenic bamboo grove located in the Arashiyama district of Kyoto."));
	            places.add(Map.of("name", "Osaka Castle", "image", "osaka_castle.jpg", "description", "A famous historical landmark in Osaka with beautiful cherry blossoms in spring."));
	            break;

	        case "USA":
	            places.add(Map.of("name", "Grand Canyon", "image", "grand_canyon.jpg", "description", "A massive canyon in Arizona with stunning views."));
	            places.add(Map.of("name", "Statue of Liberty", "image", "liberty.jpg", "description", "An iconic symbol of freedom located in New York City."));
	            places.add(Map.of("name", "Yellowstone National Park", "image", "yellowstone.jpg", "description", "A vast wilderness area known for its geothermal features and wildlife."));
	            places.add(Map.of("name", "Times Square", "image", "times_square.jpg", "description", "A major commercial and tourist hub in New York City."));
	            places.add(Map.of("name", "Golden Gate Bridge", "image", "golden_gate.jpg", "description", "A famous suspension bridge in San Francisco."));
	            break;

	        case "Italy":
	            places.add(Map.of("name", "Colosseum", "image", "colosseum.jpeg", "description", "An ancient amphitheater in Rome."));
	            places.add(Map.of("name", "Venice Canals", "image", "venice_canals.jpeg", "description", "Famous canals and gondolas in the city of Venice."));
	            places.add(Map.of("name", "Leaning Tower of Pisa", "image", "pisa.jpg", "description", "The world-famous leaning tower in Pisa."));
	            places.add(Map.of("name", "Amalfi Coast", "image", "amalfi_coast.jpeg", "description", "A beautiful coastal area known for its cliffs and Mediterranean scenery."));
	            places.add(Map.of("name", "Vatican City", "image", "vatican.jpeg", "description", "The smallest independent state and home to the Pope."));
	            break;

	        case "Australia":
	            places.add(Map.of("name", "Sydney Opera House", "image", "opera_house.jpeg", "description", "An iconic architectural marvel in Sydney."));
	            places.add(Map.of("name", "Great Barrier Reef", "image", "reef.jpeg", "description", "The world's largest coral reef system off the coast of Queensland."));
	            places.add(Map.of("name", "Uluru", "image", "uluru.jpeg", "description", "A large sandstone rock formation in the Northern Territory."));
	            places.add(Map.of("name", "Bondi Beach", "image", "bondi.jpeg", "description", "A popular beach in Sydney known for its surf culture."));
	            places.add(Map.of("name", "Kakadu National Park", "image", "kakadu.jpg", "description", "A protected area in the Northern Territory famous for its biodiversity."));
	            break;

	        case "Brazil":
	            places.add(Map.of("name", "Christ the Redeemer", "image", "redeemer.jpg", "description", "A massive statue of Jesus overlooking Rio de Janeiro."));
	            places.add(Map.of("name", "Amazon Rainforest", "image", "amazon.jpeg", "description", "The world's largest tropical rainforest."));
	            places.add(Map.of("name", "Iguazu Falls", "image", "iguazu.jpeg", "description", "One of the largest and most stunning waterfall systems in the world."));
	            places.add(Map.of("name", "Copacabana Beach", "image", "copacabana.jpeg", "description", "A famous beach in Rio known for its lively atmosphere."));
	            places.add(Map.of("name", "Sugarloaf Mountain", "image", "sugarloaf.jpg", "description", "A peak in Rio with a scenic cable car ride to the top."));
	            break;
	            
	        default:
	            places.add(Map.of("name", "Popular Place", "image", "default.jpg", "description", "Discover beautiful places in this country."));
	            break;
	    }

	    model.addAttribute("countryName", countryName);
	    model.addAttribute("places", places);
	    return "countryDetails";
	}



}
