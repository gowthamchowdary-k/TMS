<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${countryName} - Popular Places</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: white;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            position: relative;
        }
        h1 {
            text-align: center;
            font-size: 2em;
        }
        .close-button {
            position: absolute;
            top: 10px;
            right: 10px;
            background-color: transparent;
            border: none;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            color: #333;
        }
        .place {
		    display: flex;
		    align-items: center;
		    margin-bottom: 20px;
		}
		
		.place img {
		    width: 150px;
		    height: 100px;
		    border-radius: 5px;
		    object-fit: cover;
		    cursor: pointer;
		    margin-right: 10px; /* Add space between image and text */
		}
		
		.place-info {
		    max-width: 70%;
		    margin-left: 10px; /* Optional extra spacing if needed */
		}
		
		.place-info h3 {
		    margin: 0;
		    font-size: 1.2em;
		}
		
		.place-info p {
		    margin: 5px 0 0;
		    color: #555;
		    font-size: 0.9em;
		}


        /* Popup Styles */
        .popup {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.5);
        }
        .popup-content {
            background-color: #fefefe;
            margin: 10% auto;
            padding: 30px;
            border-radius: 10px;
            width: 80%;
            max-width: 800px;
            position: relative;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .popup-close {
            color: #aaa;
            position: absolute;
            top: 10px;
            right: 20px;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        /* Image slider container */
        .image-slider {
            position: relative;
            display: flex;
            overflow: hidden;
            width: 100%;
            margin-bottom: 20px;
        }

        .slider-image {
            width: 80%;
            max-width: 600px;
            height: auto;
            object-fit: contain;
            transition: transform 0.5s ease-in-out;
            display: none;
            margin: 0 auto;
            position: relative;
        }

        /* Style for navigation buttons (previous/next) */
        .slider-nav {
            position: absolute;
            top: 50%;
            z-index: 10;
            font-size: 2em;
            color: white;
            background-color: rgba(0,0,0,0.5);
            padding: 10px;
            cursor: pointer;
            user-select: none;
        }

        .slider-nav.left {
            left: 10px;
        }

        .slider-nav.right {
            right: 10px;
        }

        /* Hover effect to scale images */
        .image-slider:hover .slider-image {
            transform: scale(1.05);
        }
        .book-btn {
		    background-color: #ff5722; /* Change to your desired color */
		    color: white; /* Button text color */
		    border: none; /* Remove borders */
		    padding: 15px 25px; /* Increase padding for size */
		    font-size: 1.2em; /* Increase font size */
		    border-radius: 5px; /* Add rounded corners */
		    cursor: pointer; /* Pointer cursor on hover */
		    transition: background-color 0.3s ease, transform 0.2s ease; /* Smooth hover effect */
		}
		
		.book-btn:hover {
		    background-color: #e64a19; /* Slightly darker shade on hover */
		    transform: scale(1.05); /* Slight zoom-in effect */
		}
        
    </style>
</head>
<body>

<div class="container">
    <h1>Popular Places in ${countryName}</h1>
    <button class="close-button" onclick="location.href='/explore'">X</button>

    <form id="placeForm">
        <c:forEach var="place" items="${places}">
            <div class="place">
                <img src="<c:url value='/images/${place.image}' />" alt="${place.name} Image" 
                     onclick="openPlacePopup('${place.name}', '${place.image}', '${place.description}')">
                <div class="place-info">
                    <h3>${place.name}</h3>
                    <p>${place.description}</p>
                </div>
            </div>
        </c:forEach>
    </form>
</div>

<!-- Place Details Popup -->
<div id="placePopup" class="popup">
    <div class="popup-content">
        <span class="popup-close" onclick="closePlacePopup()">&times;</span>
        <h2 id="popupTitle"></h2>
        <p id="popupDescription"></p>
        <div id="popupAdditionalDetails"></div>
    </div>
</div>

<script>
    // Open the popup when an image is clicked
    function openPlacePopup(name, image, description) {
        const popup = document.getElementById('placePopup');
        const popupTitle = document.getElementById('popupTitle');
        const popupDescription = document.getElementById('popupDescription');
        const popupAdditionalDetails = document.getElementById('popupAdditionalDetails');

        // Set popup content
        popupTitle.textContent = name;
        popupDescription.textContent = description;

        // Add additional details and include the Book a Trip button for Taj Mahal
        const additionalDetails = getAdditionalDetails(name);
        popupAdditionalDetails.innerHTML = additionalDetails;

        if (name === "Taj Mahal") {
            popupAdditionalDetails.innerHTML += `
            	<button class="book-btn" onclick="redirectToBooking('${name}')">
                      Book a Trip ${name}
                </button>

            `;
        }
        else if (name === "Jaipur City Palace") {
            popupAdditionalDetails.innerHTML += `
                <button class="book-btn" onclick="redirectToBooking('${name}')">
                    Book a Trip ${name}
                </button>
            `;
        }
        else if (name === "Kerala Backwaters") {
            popupAdditionalDetails.innerHTML += `
                <button class="book-btn" onclick="redirectToBooking('${name}')">
                    Book a Trip ${name}
                </button>
            `;
        }
        else if (name === "Goa Beaches") {
            popupAdditionalDetails.innerHTML += `
                <button class="book-btn" onclick="redirectToBooking('${name}')">
                    Book a Trip ${name}
                </button>
            `;
        }
        else if (name === "Himalayas") {
            popupAdditionalDetails.innerHTML += `
                <button class="book-btn" onclick="redirectToBooking('${name}')">
                    Book a Trip ${name}
                </button>
            `;
        }

        popup.style.display = 'block';

        // Show the first image in the slider when the popup opens
        const images = document.querySelectorAll('.slider-image');
        if (images.length > 0) {
            images[0].style.display = 'block';
        }
    }

    // Close the popup when the close button is clicked
    function closePlacePopup() {
        const popup = document.getElementById('placePopup');
        popup.style.display = 'none';
    }

    // Redirect to booking page for a specific place
    function redirectToBooking(placeName) {
        const encodedPlace = encodeURIComponent(placeName);
        window.location.href = `/booking?place=${encodedPlace}`;
    }

    // Function to provide additional details for specific places
    function getAdditionalDetails(placeName) {
        const detailsMap = {
        // PLACES IN INDIA
        		'Taj Mahal': `
                    <h3>More About Taj Mahal</h3>
                    <div class="image-slider">
                        <img src="/images/tajmahal.jpeg" alt="Taj Mahal Extra Image 1" class="slider-image">
                        <img src="/images/tajmahal1.jpeg" alt="Taj Mahal Extra Image 1" class="slider-image">
                        <img src="/images/tajmahal2.jpeg" alt="Taj Mahal Extra Image 2" class="slider-image">
                        <img src="/images/tajmahal3.jpeg" alt="Taj Mahal Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    The Taj Mahal is an iconic symbol of India's rich history, built by Mughal Emperor Shah Jahan in memory of his wife Mumtaz Mahal. It is widely regarded as one of the most beautiful architectural structures in the world and a symbol of eternal love. It was completed in 1653 and is now a UNESCO World Heritage Site. The Taj Mahal is renowned for its stunning white marble structure, intricate carvings, and lush gardens surrounding it.
    	            </p>
    	            <p>
    	                <strong>Architecture:</strong><br>
    	                The Taj Mahal showcases Mughal architecture, which is a combination of Indian, Persian, Ottoman Turkish, and Central Asian architectural styles. The monument is constructed primarily of white marble, adorned with intricate inlay work and carvings. The central dome, surrounded by minarets, is a remarkable feat of engineering, while the surrounding gardens are designed in a traditional Mughal style.
    	            </p>
    	            <p>
    	                <strong>Visiting Experience:</strong><br>
    	                Visitors from around the world come to see the Taj Mahal in person, and its breathtaking beauty never fails to impress. The monument is especially stunning at sunrise and sunset when the changing light causes the marble to appear to change color. The Taj Mahal is not just a visual masterpiece but also a serene and peaceful place, offering visitors a glimpse into the grandeur of India's royal history.
    	            </p>
    	            <p>
    	                <strong>Interesting Facts:</strong><br>
    	                - The Taj Mahal is often referred to as the "Crown of Palaces."<br>
    	                - It took over 20 years to complete the Taj Mahal and employed thousands of artisans, workers, and craftsmen.<br>
    	                - The monument's design was intended to represent the Garden of Paradise.<br>
    	                - The Taj Mahal attracts over 7 million visitors each year, making it one of the most visited monuments in the world.
    	            </p>

                `,

                'Jaipur City Palace': `
                    <h3>More About Jaipur City Palace</h3>
                    <div class="image-slider">
                    	<img src="/images/jaipur.jpeg" alt="Jaipur City Palace Extra Image 1" class="slider-image">
                        <img src="/images/city-palace1.jpeg" alt="Jaipur City Palace Extra Image 1" class="slider-image">
                        <img src="/images/city-palace2.jpeg" alt="Jaipur City Palace Extra Image 2" class="slider-image">
                        <img src="/images/city-palace3.jpeg" alt="Jaipur City Palace Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    The Jaipur City Palace, located in the heart of the Pink City, Jaipur, is a majestic blend of Mughal and Rajput architecture. Constructed in 1727 by Maharaja Sawai Jai Singh II, it served as the seat of the Maharaja of Jaipur. The palace complex remains a symbol of the rich cultural heritage of Rajasthan and is an iconic representation of India's royal history.
                    </p>
                    <p>
                    <strong>Architecture:</strong><br>
                    The Jaipur City Palace showcases a mix of traditional Rajasthani and Mughal architectural styles. The complex includes several grand structures such as the Chandra Mahal, Mubarak Mahal, and Diwan-i-Khas. Notable features include intricately carved doorways, detailed frescoes, and beautiful courtyards. The palace is adorned with vibrant colors and patterns, and the gardens surrounding it add to its splendor.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors to the Jaipur City Palace are captivated by its stunning architecture and regal ambiance. The museum within the palace displays royal artifacts, including costumes, weapons, and artwork, offering a glimpse into the luxurious lifestyle of Rajasthan's royalty. The Peacock Gate and the Pitam Niwas Chowk are especially popular spots for photography. The palace's blend of history and artistry makes it a must-visit destination.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - The Chandra Mahal within the City Palace still serves as the residence of the royal family.<br>
                    - The palace complex covers a vast area, with several parts open to the public as museums and galleries.<br>
                    - The Mubarak Mahal was designed as a guesthouse for royal visitors.<br>
                    - The intricate gates in the palace, like the Peacock Gate, represent the four seasons and are adorned with exquisite craftsmanship.<br>
                    - Jaipur City Palace was one of the first planned cities in India, with the palace being its centerpiece.<br>
                    </p>
                `,
                'Kerala Backwaters': `
                    <h3>More About Kerala Backwaters</h3>
                    <div class="image-slider">
                   	    <img src="/images/kerala.jpeg" alt="Kerala Backwaters Extra Image 1" class="slider-image">
                        <img src="/images/backwaters1.jpeg" alt="Kerala Backwaters Extra Image 1" class="slider-image">
                        <img src="/images/backwaters2.jpeg" alt="Kerala Backwaters Extra Image 2" class="slider-image">
                        <img src="/images/backwaters3.jpeg" alt="Kerala Backwaters Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    The Kerala Backwaters are a network of interconnected canals, rivers, and lakes that stretch along the state of Kerala. Historically, they served as vital trade and transportation routes. Today, they are a major tourist attraction and a symbol of Kerala's natural beauty and cultural heritage.
                    </p>
                    <p>
                    <strong>Scenic Beauty:</strong><br>
                    The backwaters are renowned for their serene beauty, with lush greenery, swaying coconut palms, and tranquil waters. Houseboats, locally known as kettuvallams, offer a unique way to explore the backwaters, gliding through the calm waters while showcasing picturesque landscapes and traditional village life.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    A visit to the Kerala Backwaters is a serene and unforgettable experience. Alappuzha and Kumarakom are among the most popular destinations for houseboat cruises. Visitors can enjoy delicious Kerala cuisine onboard while taking in the sights and sounds of the surrounding nature. Sunsets over the backwaters are particularly mesmerizing.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - The Vembanad Lake, India's longest lake, is part of the backwaters.<br>
                    - The annual Nehru Trophy Snake Boat Race is held in Alappuzha backwaters.<br>
                    - The backwaters support a unique ecosystem with diverse flora and fauna.<br>
                    - Houseboats were once used to transport rice and spices in Kerala.<br>
                    - The backwaters cover an area of approximately 900 kilometers of waterways.<br>
                    </p>
                `,
                'Goa Beaches': `
                    <h3>More About Goa Beaches</h3>
                    <div class="image-slider">
                   		<img src="/images/goa.jpg" alt="Goa Beaches Extra Image 1" class="slider-image">
                        <img src="/images/goa-beach1.jpeg" alt="Goa Beaches Extra Image 1" class="slider-image">
                        <img src="/images/goa-beach2.jpeg" alt="Goa Beaches Extra Image 2" class="slider-image">
                        <img src="/images/goa-beach3.jpeg" alt="Goa Beaches Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    Goa's beaches are a major attraction for both domestic and international tourists. Once a Portuguese colony, Goa is famous for its blend of Indian and European cultures, vibrant nightlife, and stunning coastal landscapes.
                    </p>
                    <p>
                    <strong>Scenic Beauty:</strong><br>
                    Goa's coastline stretches over 100 kilometers, dotted with sandy beaches, palm-fringed shores, and turquoise waters. From the lively Baga and Calangute beaches to the serene Palolem and Agonda beaches, there is something for everyone.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can enjoy a range of activities, including sunbathing, water sports, and beach parties. Goa is also known for its fresh seafood, beach shacks, and vibrant flea markets. Exploring historical sites like the Basilica of Bom Jesus and Fort Aguada adds cultural depth to the beach experience.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - Goa has over 30 beaches, each with its unique charm and vibe.<br>
                    - It is known as the party capital of India due to its vibrant nightlife.<br>
                    - The Dudhsagar Waterfalls near Goa offer an adventurous getaway.<br>
                    - Goa’s beaches host the famous Sunburn Festival, a major electronic dance music event.<br>
                    - The beaches are an important nesting site for Olive Ridley turtles.<br>
                    </p>
                `,
                'Himalayas': `
                    <h3>More About Himalayas</h3>
                    <div class="image-slider">
                    	<img src="/images/himalayas.jpg" alt="Himalayas Extra Image 1" class="slider-image">
                        <img src="/images/himalayas1.jpeg" alt="Himalayas Extra Image 1" class="slider-image">
                        <img src="/images/himalayas2.jpeg" alt="Himalayas Extra Image 2" class="slider-image">
                        <img src="/images/himalayas3.jpeg" alt="Himalayas Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    The Himalayas, often referred to as the "Roof of the World," are the tallest mountain range on Earth, spanning five countries: India, Nepal, Bhutan, China, and Pakistan. They have been a source of inspiration for explorers, pilgrims, and adventurers for centuries, symbolizing spiritual significance and natural grandeur.
                    </p>
                    <p>
                    <strong>Scenic Beauty:</strong><br>
                    The Himalayas are known for their snow-capped peaks, alpine meadows, deep valleys, and pristine rivers. They are home to Mount Everest, the world’s highest peak, and Kanchenjunga, the third highest. The region also boasts diverse flora and fauna, along with stunning trekking trails.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    The Himalayas offer an unparalleled experience for nature lovers, adventure enthusiasts, and spiritual seekers. Popular activities include trekking, mountaineering, river rafting, and wildlife exploration. Destinations like Manali, Leh-Ladakh, and Darjeeling provide unique glimpses into Himalayan life.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - The Himalayas are home to 10 of the world’s 14 highest peaks.<br>
                    - They play a crucial role in influencing India’s climate by blocking cold winds from Central Asia.<br>
                    - The Himalayas are known as the origin of sacred rivers like the Ganga and Yamuna.<br>
                    - They are often referred to in Hindu scriptures as the abode of gods.<br>
                    - The Himalayan region is home to unique wildlife, including the snow leopard and red panda.<br>
                    </p>
                `,

                
          // PLACES IN FRANCE
          
                'Eiffel Tower': `
                    <h3>More About Eiffel Tower</h3>
                    <div class="image-slider">
                        <img src="/images/eiffel1.jpeg" alt="Eiffel Tower Extra Image 1" class="slider-image">
                        <img src="/images/eiffel2.jpeg" alt="Eiffel Tower Extra Image 2" class="slider-image">
                        <img src="/images/eiffel3.jpeg" alt="Eiffel Tower Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    The Eiffel Tower, a global cultural icon of France, was constructed in 1889 as the centerpiece for the World's Fair in Paris. Designed by Gustave Eiffel, it is one of the most recognizable and visited monuments in the world, symbolizing architectural ingenuity and French elegance.
                    </p>
                    <p>
                    <strong>Architecture:</strong><br>
                    Standing at 330 meters tall, the tower is made of iron lattice and features three levels accessible to visitors. Its innovative design and structural engineering were groundbreaking at the time of construction, making it an enduring marvel of modern architecture.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can take elevators or climb stairs to enjoy stunning panoramic views of Paris from different levels. The Eiffel Tower is especially enchanting at night when it sparkles with thousands of lights, creating a magical atmosphere.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - The Eiffel Tower was initially criticized but became an iconic symbol over time.<br>
                    - It is repainted every seven years to prevent rusting.<br>
                    - The tower attracts nearly 7 million visitors annually.<br>
                    - During WWII, the elevator cables were cut to hinder enemy access.<br>
                    - It was the tallest structure in the world until 1930.<br>
                    </p>
                `,
                'Louvre Museum': `
                    <h3>More About Louvre Museum</h3>
                    <div class="image-slider">
                        <img src="/images/louvre1.jpeg" alt="Louvre Museum Extra Image 1" class="slider-image">
                        <img src="/images/louvre2.jpeg" alt="Louvre Museum Extra Image 2" class="slider-image">
                        <img src="/images/louvre3.jpeg" alt="Louvre Museum Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    The Louvre Museum, originally a royal palace, was transformed into a museum in 1793. Located in Paris, it is the world's largest art museum and a historic monument, housing a vast collection of art and artifacts from ancient civilizations to modern times.
                    </p>
                    <p>
                    <strong>Art and Exhibits:</strong><br>
                    The museum is famous for its masterpieces, including the Mona Lisa, Venus de Milo, and the Winged Victory of Samothrace. Its galleries showcase over 35,000 works of art across eight departments, from Egyptian antiquities to European paintings.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can explore the Louvre's magnificent halls, its iconic glass pyramid entrance, and the rich cultural treasures within. Guided tours and audio guides provide insights into the history and significance of its collections.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - The Louvre Palace was originally built in the 12th century as a fortress.<br>
                    - The museum attracts over 10 million visitors annually.<br>
                    - Its iconic glass pyramid was designed by architect I.M. Pei.<br>
                    - Only a fraction of the museum's 500,000 artworks are displayed at a time.<br>
                    - It is featured in the novel *The Da Vinci Code*.<br>
                    </p>
                `,
                'Mont Saint-Michel': `
                    <h3>More About Mont Saint-Michel</h3>
                    <div class="image-slider">
                        <img src="/images/mont1.jpeg" alt="Mont Saint-Michel Extra Image 1" class="slider-image">
                        <img src="/images/mont2.jpeg" alt="Mont Saint-Michel Extra Image 2" class="slider-image">
                        <img src="/images/mont3.jpeg" alt="Mont Saint-Michel Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    Mont Saint-Michel, located in Normandy, France, is a historic island commune crowned by a medieval abbey. Built between the 8th and 16th centuries, it has been a significant pilgrimage site and is now a UNESCO World Heritage Site.
                    </p>
                    <p>
                    <strong>Scenic Beauty:</strong><br>
                    The island is famous for its dramatic tides, which create an ethereal atmosphere as it alternates between being surrounded by water and vast sandbanks. The towering abbey and quaint village streets add to its picturesque charm.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can explore the abbey's Gothic architecture, enjoy panoramic views from its terraces, and wander through the cobbled streets filled with shops and cafes. The site is especially magical at sunrise or sunset.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - Mont Saint-Michel inspired the design of Minas Tirith in *The Lord of the Rings*.<br>
                    - It has served as a fortress during wars and conflicts.<br>
                    - The abbey's spire is topped by a statue of Saint Michael slaying a dragon.<br>
                    - The surrounding tides are among the highest in Europe.<br>
                    - Approximately 3 million tourists visit Mont Saint-Michel annually.<br>
                    </p>
                `,
                'French Riviera': `
                    <h3>More About French Riviera</h3>
                    <div class="image-slider">
                        <img src="/images/riviera1.jpeg" alt="French Riviera Extra Image 1" class="slider-image">
                        <img src="/images/riviera2.jpeg" alt="French Riviera Extra Image 2" class="slider-image">
                        <img src="/images/riviera3.jpeg" alt="French Riviera Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    The French Riviera, or Côte d'Azur, is a glamorous Mediterranean coastline in southeastern France. Known for its luxurious lifestyle, stunning beaches, and historic towns, it has been a favorite destination for artists, celebrities, and travelers since the 19th century.
                    </p>
                    <p>
                    <strong>Scenic Beauty:</strong><br>
                    The Riviera boasts turquoise waters, sandy beaches, and picturesque towns like Nice, Cannes, and Saint-Tropez. Its lush landscapes, colorful architecture, and lively atmosphere create a perfect blend of relaxation and excitement.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can enjoy sunbathing on exclusive beaches, exploring art museums, and savoring fine French cuisine. Highlights include the Cannes Film Festival, luxury yachts in Monaco, and the charming villages of Eze and Antibes.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - The French Riviera enjoys over 300 days of sunshine annually.<br>
                    - Pablo Picasso and Henri Matisse found inspiration here.<br>
                    - Monaco, a microstate, is part of the Riviera.<br>
                    - The Cannes Film Festival attracts international stars every May.<br>
                    - The area is a hub for luxury, with high-end boutiques and glamorous casinos.<br>
                    </p>
                `,
                'Palace of Versailles': `
                	<h3>More About the Palace of Versailles</h3>
                	<div class="image-slider">
                	    <img src="/images/versailles1.jpeg" alt="Palace of Versailles Image 1" class="slider-image">
                	    <img src="/images/versailles2.jpeg" alt="Palace of Versailles Image 2" class="slider-image">
                	    <img src="/images/versailles3.jpeg" alt="Palace of Versailles Image 3" class="slider-image">
                	    <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                	    <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                	</div>
                	<p>
                	<strong>History and Importance:</strong><br>
                	The Palace of Versailles, located just outside Paris, is one of the most iconic landmarks in France. Originally a hunting lodge for King Louis XIII, it was transformed and expanded by his son, Louis XIV, into a grand royal palace. Versailles became the political heart of France from 1682 until the French Revolution in 1789.
                	</p>
                	<p>
                	<strong>Architectural Beauty:</strong><br>
                	The Palace is renowned for its extravagant architecture, including the Hall of Mirrors, vast gardens, and ornate rooms. It is a prime example of French Baroque design, blending opulence with symmetry and grandeur. The extensive grounds feature fountains, sculptures, and beautifully manicured lawns.
                	</p>
                	<p>
                	<strong>Visiting Experience:</strong><br>
                	Visitors can explore the lavish rooms of the palace, including the King's and Queen's apartments, and wander through the stunning gardens. Don't miss the Grand Trianon and the Petit Trianon, former retreats of the royal family. The palace also hosts various art exhibits and special events throughout the year.
                	</p>
                	<p>
                	<strong>Interesting Facts:</strong><br>
                	- The Palace of Versailles has over 2,300 rooms.<br>
                	- The Hall of Mirrors is where the Treaty of Versailles was signed in 1919, ending World War I.<br>
                	- The palace gardens cover nearly 2,000 acres and include over 50 fountains.<br>
                	- Louis XIV, also known as the Sun King, reigned for over 70 years and made Versailles the symbol of absolute monarchy.<br>
                	- Versailles was declared a UNESCO World Heritage site in 1979.<br>
                	</p>
                `,
                
                
           // PLACES FROM JAPAN
                'Mount Fuji': `
                    <h3>More About Mount Fuji</h3>
                    <div class="image-slider">
                        <img src="/images/fuji1.jpeg" alt="Mount Fuji Extra Image 1" class="slider-image">
                        <img src="/images/fuji2.jpeg" alt="Mount Fuji Extra Image 2" class="slider-image">
                        <img src="/images/fuji3.jpeg" alt="Mount Fuji Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    Mount Fuji, Japan’s highest peak, is an active stratovolcano standing at 3,776 meters. It has long been a revered symbol of Japan, representing beauty and strength. It is not only a national icon but also a UNESCO World Heritage site, attracting pilgrims, climbers, and artists.
                    </p>
                    <p>
                    <strong>Scenic Beauty:</strong><br>
                    Mount Fuji is renowned for its symmetrical conical shape, often covered in snow, creating a stunning sight throughout the year. The surrounding Five Lakes and forests provide a perfect setting for nature lovers, while the view from the summit offers breathtaking panoramas.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can hike the mountain during the official climbing season in summer, or explore the scenic areas around the base, such as the Fuji Five Lakes and the nearby hot springs. The view of Mount Fuji is particularly popular during sunrise and sunset, when the changing light enhances its beauty.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - Mount Fuji is an active volcano, though it has not erupted since 1707.<br>
                    - It is considered one of Japan’s "Three Holy Mountains" alongside Mount Tate and Mount Haku.<br>
                    - The mountain is a popular subject in art, especially in the iconic works of Hokusai.<br>
                    - Around 300,000 climbers attempt to summit Mount Fuji annually.<br>
                    - Fuji's beauty is celebrated in Japanese culture, often symbolizing peace and tranquility.<br>
                    </p>
                `,
                'Kyoto Temples': `
                    <h3>More About Kyoto Temples</h3>
                    <div class="image-slider">
                        <img src="/images/kyoto1.jpeg" alt="Kyoto Temples Extra Image 1" class="slider-image">
                        <img src="/images/kyoto2.jpeg" alt="Kyoto Temples Extra Image 2" class="slider-image">
                        <img src="/images/kyoto3.jpeg" alt="Kyoto Temples Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    Kyoto, once the imperial capital of Japan, is home to over 1,600 temples and shrines, making it a cultural and spiritual heart of the country. These historic temples represent centuries of Japanese architecture, culture, and religious practice.
                    </p>
                    <p>
                    <strong>Notable Temples:</strong><br>
                    Some of Kyoto's most famous temples include Kinkaku-ji (Golden Pavilion), Ginkaku-ji (Silver Pavilion), and Kiyomizu-dera, each showcasing distinct architectural styles and rich history. The Zen gardens, pagodas, and serene surroundings make these temples a peaceful retreat.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can explore the tranquil beauty of these temples, with stunning gardens, ornate statues, and panoramic views of the surrounding mountains. Many temples also offer tea ceremonies, traditional performances, and meditation experiences.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - Kyoto's temples are recognized as UNESCO World Heritage Sites.<br>
                    - Kiyomizu-dera is known for its large wooden stage that overlooks the cherry blossoms in spring.<br>
                    - Zen Buddhism, which emphasizes meditation and simplicity, is well-represented in Kyoto's temples.<br>
                    - The Golden Pavilion, Kinkaku-ji, is coated in real gold leaf.<br>
                    - Kyoto has been the setting for many classical Japanese tea ceremonies.<br>
                    </p>
                `,
                'Tokyo Tower': `
                    <h3>More About Tokyo Tower</h3>
                    <div class="image-slider">
                        <img src="/images/tokyo-tower1.jpeg" alt="Tokyo Tower Extra Image 1" class="slider-image">
                        <img src="/images/tokyo-tower2.jpeg" alt="Tokyo Tower Extra Image 2" class="slider-image">
                        <img src="/images/tokyo-tower3.jpeg" alt="Tokyo Tower Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    Tokyo Tower, inspired by the Eiffel Tower, is a communications and observation tower in Tokyo, standing at 333 meters. Completed in 1958, it was Japan's tallest structure for several years and remains an iconic symbol of modernity and innovation.
                    </p>
                    <p>
                    <strong>Architecture:</strong><br>
                    Tokyo Tower’s red and white lattice structure is a striking example of engineering. The tower offers two observation decks, providing panoramic views of Tokyo, including landmarks like Mount Fuji and the bustling metropolis below.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can ascend to the observation decks and enjoy spectacular views of the city skyline. The tower is particularly enchanting at night when it is illuminated, creating a beautiful contrast against the dark sky. There are also shops, restaurants, and even an aquarium in the tower complex.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - Tokyo Tower was the tallest structure in Japan until the completion of the Tokyo Skytree in 2012.<br>
                    - The tower is a major tourist attraction and a symbol of Japan's post-war economic recovery.<br>
                    - It is used for television broadcasting and telecommunications.<br>
                    - Tokyo Tower has appeared in many films, television shows, and anime.<br>
                    - The tower was designed to withstand earthquakes and high winds.<br>
                    </p>
                `,
                'Arashiyama Bamboo Forest': `
                    <h3>More About Arashiyama Bamboo Forest</h3>
                    <div class="image-slider">
                        <img src="/images/bamboo1.jpeg" alt="Arashiyama Bamboo Forest Extra Image 1" class="slider-image">
                        <img src="/images/bamboo2.jpeg" alt="Arashiyama Bamboo Forest Extra Image 2" class="slider-image">
                        <img src="/images/bamboo3.jpeg" alt="Arashiyama Bamboo Forest Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    Located in Kyoto, the Arashiyama Bamboo Forest is one of Japan’s most famous natural sites. It is an enchanting grove of towering bamboo stalks that creates a serene and peaceful atmosphere. This forest has long been associated with spirituality and tranquility in Japanese culture.
                    </p>
                    <p>
                    <strong>Scenic Beauty:</strong><br>
                    The sight of the bamboo swaying in the wind, creating a soothing rustling sound, makes the forest a unique experience. The path through the forest is lined with towering bamboo, offering a surreal and calming environment. It's a perfect spot for photos and reflection.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can stroll through the bamboo pathways, which lead to other attractions like the Tenryu-ji Temple and the Togetsukyo Bridge. The forest is particularly magical in the early morning or late afternoon when the light filters through the bamboo.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - Arashiyama Bamboo Forest is often featured in Japanese films and media.<br>
                    - The sound of the wind moving through the bamboo is protected by law as a cultural treasure.<br>
                    - The bamboo in the forest can grow up to 16 meters in height.<br>
                    - It is located near other popular attractions in the Arashiyama area, like the Iwatayama Monkey Park.<br>
                    - The forest is most beautiful during the spring and autumn seasons when the surrounding foliage adds vibrant colors to the scene.<br>
                    </p>
                `,
                'Osaka Castle': `
                    <h3>More About Osaka Castle</h3>
                    <div class="image-slider">
                        <img src="/images/osaka-castle1.jpeg" alt="Osaka Castle Extra Image 1" class="slider-image">
                        <img src="/images/osaka-castle2.jpeg" alt="Osaka Castle Extra Image 2" class="slider-image">
                        <img src="/images/osaka-castle3.jpeg" alt="Osaka Castle Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    Osaka Castle is a historic castle in Osaka, Japan, originally built in the 16th century by Toyotomi Hideyoshi. It played a major role in the unification of Japan during the Sengoku period and stands as a symbol of the power of the era.
                    </p>
                    <p>
                    <strong>Architecture:</strong><br>
                    The castle is known for its striking design, featuring a multi-layered main tower with a golden ornament at the top. Its stone walls and expansive grounds are surrounded by moats and beautiful parks, offering a glimpse into Japan's feudal history.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can tour the castle’s museum, which houses artifacts from the feudal period, and enjoy panoramic views from the observation deck. The surrounding park area is especially popular during cherry blossom season.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - Osaka Castle is one of Japan’s most famous landmarks and a symbol of the city.<br>
                    - The original castle was destroyed in the 17th century but rebuilt in the 1930s.<br>
                    - The castle grounds feature a large park that is a popular destination for hanami (cherry blossom viewing).<br>
                    - The main tower of the castle is over 55 meters tall.<br>
                    - It is one of the top tourist attractions in Osaka, drawing millions of visitors annually.<br>
                    </p>
                `,

                
                
           // PLACES FROM USA
                'Grand Canyon': `
                    <h3>More About Grand Canyon</h3>
                    <div class="image-slider">
                        <img src="/images/grand-canyon1.jpg" alt="Grand Canyon Extra Image 1" class="slider-image">
                        <img src="/images/grand-canyon2.jpg" alt="Grand Canyon Extra Image 2" class="slider-image">
                        <img src="/images/grand-canyon3.jpg" alt="Grand Canyon Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    The Grand Canyon is one of the most famous natural wonders in the world. Carved by the Colorado River over millions of years, it stretches over 277 miles (446 km) in length and reaches depths of over a mile (1,857 meters). A UNESCO World Heritage Site, it is renowned for its breathtaking beauty and geological significance.
                    </p>
                    <p>
                    <strong>Scenic Beauty:</strong><br>
                    The Grand Canyon offers stunning vistas with its layered rock formations, vibrant sunsets, and dramatic cliffs. The views from various points along the rim are simply spectacular, with the ever-changing light adding to the landscape’s grandeur.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can explore the canyon by hiking, rafting on the Colorado River, or even by air with helicopter tours. The South Rim is the most popular area to visit, with numerous lookout points, visitor centers, and trails. The Grand Canyon is especially mesmerizing at sunrise and sunset.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - The Grand Canyon is estimated to be around 5 to 6 million years old.<br>
                    - It is one of the seven natural wonders of the world.<br>
                    - Over 5 million people visit the Grand Canyon each year.<br>
                    - The canyon is home to diverse wildlife, including bighorn sheep, coyotes, and California condors.<br>
                    - The Grand Canyon was once part of the ancestral lands of Native American tribes.<br>
                    </p>
                `,
                'Statue of Liberty': `
                    <h3>More About Statue of Liberty</h3>
                    <div class="image-slider">
                        <img src="/images/statue-of-liberty1.jpg" alt="Statue of Liberty Extra Image 1" class="slider-image">
                        <img src="/images/statue-of-liberty2.jpg" alt="Statue of Liberty Extra Image 2" class="slider-image">
                        <img src="/images/statue-of-liberty3.jpg" alt="Statue of Liberty Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    The Statue of Liberty, located on Liberty Island in New York Harbor, was a gift from France to the United States in 1886. It symbolizes freedom, democracy, and the enduring relationship between the two nations. The statue has welcomed millions of immigrants arriving to America and remains one of the most recognized landmarks in the world.
                    </p>
                    <p>
                    <strong>Design and Symbolism:</strong><br>
                    Designed by French sculptor Frédéric Auguste Bartholdi, the statue stands 305 feet (93 meters) tall from the ground to the tip of the torch. It holds a tablet inscribed with the date of the U.S. Declaration of Independence, July 4, 1776. The statue represents liberty and enlightenment, with the torch symbolizing freedom.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can take a ferry to Liberty Island, where they can explore the statue and its pedestal. The crown offers stunning views of New York City, and the museum provides deeper insights into the statue's history and significance.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - The Statue of Liberty was designed to be a lighthouse as well as a symbol of freedom.<br>
                    - It took four months to assemble the statue upon its arrival in the United States.<br>
                    - The statue was originally intended to be a symbol of friendship between the U.S. and France.<br>
                    - Lady Liberty's full name is "Liberty Enlightening the World."<br>
                    - The statue weighs about 225 tons.<br>
                    </p>
                `,
                'Yellowstone National Park': `
                    <h3>More About Yellowstone National Park</h3>
                    <div class="image-slider">
                        <img src="/images/yellowstone1.jpg" alt="Yellowstone National Park Extra Image 1" class="slider-image">
                        <img src="/images/yellowstone2.jpg" alt="Yellowstone National Park Extra Image 2" class="slider-image">
                        <img src="/images/yellowstone3.jpg" alt="Yellowstone National Park Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    Yellowstone National Park, established in 1872, is the first national park in the world. Located primarily in Wyoming, it spans over 2.2 million acres and is renowned for its geothermal features, wildlife, and stunning landscapes. It is also a UNESCO World Heritage Site.
                    </p>
                    <p>
                    <strong>Geothermal Features:</strong><br>
                    Yellowstone is home to more than half of the world’s geothermal features, including the famous Old Faithful geyser. The park’s hot springs, mud pots, and fumaroles create an otherworldly landscape that attracts millions of visitors every year.
                    </p>
                    <p>
                    <strong>Wildlife and Scenic Beauty:</strong><br>
                    The park is home to a wide variety of wildlife, including bison, elk, grizzly bears, and wolves. The Yellowstone River and its waterfalls, along with the vast forests and mountains, create some of the most breathtaking natural views in North America.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - Yellowstone is an active supervolcano, with the caldera covering much of the park.<br>
                    - The park receives around 4 million visitors annually.<br>
                    - Yellowstone’s Old Faithful geyser erupts approximately every 90 minutes.<br>
                    - The park was a model for the national parks system that exists today.<br>
                    - It was once home to several Native American tribes before becoming a national park.<br>
                    </p>
                `,
                'Times Square': `
                    <h3>More About Times Square</h3>
                    <div class="image-slider">
                        <img src="/images/times-square1.jpg" alt="Times Square Extra Image 1" class="slider-image">
                        <img src="/images/times-square2.jpg" alt="Times Square Extra Image 2" class="slider-image">
                        <img src="/images/times-square3.jpg" alt="Times Square Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    Times Square, located in the heart of Manhattan, New York City, is one of the most visited public spaces in the world. Known as "The Cross-roads of the World," it is a major commercial and entertainment hub, famous for its bright billboards and theaters, particularly Broadway.
                    </p>
                    <p>
                    <strong>Cultural and Economic Significance:</strong><br>
                    Times Square is not only a major tourist destination but also an important center for media, business, and culture. It is the site of the annual New Year’s Eve ball drop, a global event watched by millions.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can take in the vibrant lights, catch a Broadway show, shop in the nearby stores, or simply wander through the bustling streets. The area is especially vibrant at night, with its neon lights and large screens creating a spectacular urban experience.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - Times Square is named after the New York Times, which moved its headquarters there in 1904.<br>
                    - Over 50 million people visit Times Square every year.<br>
                    - It was originally called Longacre Square before being renamed.<br>
                    - The New Year’s Eve ball drop began in 1907 and has become an iconic annual event.<br>
                    - Times Square is a major hub for the Broadway Theatre District.<br>
                    </p>
                `,
                'Golden Gate Bridge': `
                    <h3>More About Golden Gate Bridge</h3>
                    <div class="image-slider">
                        <img src="/images/golden-gate1.jpg" alt="Golden Gate Bridge Extra Image 1" class="slider-image">
                        <img src="/images/golden-gate2.jpg" alt="Golden Gate Bridge Extra Image 2" class="slider-image">
                        <img src="/images/golden-gate3.jpg" alt="Golden Gate Bridge Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    The Golden Gate Bridge, completed in 1937, is a symbol of San Francisco and one of the most iconic suspension bridges in the world. Spanning the Golden Gate Strait, it connects San Francisco to Marin County and is known for its striking Art Deco design and its distinctive orange-red color.
                    </p>
                    <p>
                    <strong>Engineering Feat:</strong><br>
                    At the time of its completion, the Golden Gate Bridge was the longest suspension bridge in the world. It is a testament to the ingenuity and vision of its designer, Joseph Strauss, and stands as one of the most photographed structures globally.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can walk or drive across the bridge, enjoy scenic views from the nearby parks, or take photographs from popular vantage points. The bridge is especially stunning at sunrise and sunset, with its vibrant color contrasting against the bay and sky.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - The Golden Gate Bridge is 1.7 miles (2.7 km) long and 746 feet (227 meters) tall.<br>
                    - It was once the longest suspension bridge in the world.<br>
                    - The bridge’s distinctive "International Orange" color was selected to enhance visibility in San Francisco’s foggy conditions.<br>
                    - Over 10 million vehicles cross the bridge every year.<br>
                    - The Golden Gate Bridge was once considered one of the greatest engineering challenges of the 20th century.<br>
                    </p>
                `,

                
          // PLACES FROM ITALY
                'Colosseum': `
                    <h3>More About Colosseum</h3>
                    <div class="image-slider">
                        <img src="/images/colosseum1.jpg" alt="Colosseum Extra Image 1" class="slider-image">
                        <img src="/images/colosseum2.jpg" alt="Colosseum Extra Image 2" class="slider-image">
                        <img src="/images/colosseum3.jpg" alt="Colosseum Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    The Colosseum in Rome, Italy, is one of the most iconic symbols of ancient Roman architecture and engineering. Completed in 80 AD, it was originally used for gladiatorial contests and public spectacles. With a capacity of 50,000 spectators, the Colosseum is a marvel of ancient engineering.
                    </p>
                    <p>
                    <strong>Architecture:</strong><br>
                    The Colosseum features a series of arches and a complex system of corridors and chambers. It is made from concrete and stone and originally had a wooden floor. The structure was designed to hold large crowds, and its elliptical shape ensured that everyone had a clear view of the events inside.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can tour the Colosseum and learn about its history, including the gladiatorial games, animal hunts, and mock naval battles that were staged there. The interior offers a glimpse into ancient Roman entertainment, while the surrounding area provides a sense of the Colosseum’s grandeur.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - The Colosseum is also known as the Flavian Amphitheatre, named after the Flavian dynasty.<br>
                    - It was used for gladiatorial contests and public executions until the early medieval period.<br>
                    - Around 500,000 people and over a million animals are said to have died in the arena.<br>
                    - The Colosseum has been damaged by earthquakes, but it remains one of the most visited tourist attractions in the world.<br>
                    </p>
                `,
                'Venice Canals': `
                    <h3>More About Venice Canals</h3>
                    <div class="image-slider">
                        <img src="/images/venice-canals1.jpg" alt="Venice Canals Extra Image 1" class="slider-image">
                        <img src="/images/venice-canals2.jpg" alt="Venice Canals Extra Image 2" class="slider-image">
                        <img src="/images/venice-canals3.jpg" alt="Venice Canals Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    The Venice Canals are the heart of the city of Venice, Italy. Venice is built on a series of islands connected by a network of canals. These canals serve as transportation routes and have been vital to Venice's history as a major trading port.
                    </p>
                    <p>
                    <strong>Canal Structure:</strong><br>
                    The canals are lined with stunning Renaissance and Gothic architecture, creating a unique atmosphere that combines the beauty of the waterways with the charm of Venetian buildings. The Grand Canal is the most famous and largest of these waterways.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can explore the canals by gondola or vaporetto (waterbus), which offer a scenic way to see the city. The winding canals, beautiful bridges, and historic buildings create an unforgettable experience for anyone visiting Venice.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - Venice has over 150 canals and 400 bridges.<br>
                    - The canals were originally created to serve as transportation routes and facilitate trade.<br>
                    - The Grand Canal is 2.5 miles long and is lined with 170 buildings.<br>
                    - Venice is sinking at a rate of about 1-2 millimeters per year.<br>
                    </p>
                `,
                'Leaning Tower of Pisa': `
                    <h3>More About Leaning Tower of Pisa</h3>
                    <div class="image-slider">
                        <img src="/images/leaning-tower1.jpg" alt="Leaning Tower of Pisa Extra Image 1" class="slider-image">
                        <img src="/images/leaning-tower2.jpg" alt="Leaning Tower of Pisa Extra Image 2" class="slider-image">
                        <img src="/images/leaning-tower3.jpg" alt="Leaning Tower of Pisa Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    The Leaning Tower of Pisa, located in Pisa, Italy, is a freestanding bell tower of the cathedral in the Piazza del Duomo. It is famous worldwide for its unintended tilt, which was caused by unstable foundation soil. Despite this, the tower remains an iconic symbol of Italian architecture.
                    </p>
                    <p>
                    <strong>Design and Tilt:</strong><br>
                    The tower was built over a period of 199 years, from 1173 to 1372. The tilt became apparent soon after construction began due to the soft ground on one side. The tower stands 57 meters tall and has eight stories, including the chamber for the seven bells.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can climb the 294 steps to the top for panoramic views of Pisa. The Leaning Tower is part of a complex that includes the cathedral and the baptistery, all of which are remarkable examples of medieval Italian architecture.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - The Leaning Tower of Pisa was initially designed to stand vertically, but it began to lean soon after construction began.<br>
                    - The tower was closed to the public for nearly a decade to prevent further damage from the tilt.<br>
                    - The tilt has been reduced through extensive restoration efforts in recent years.<br>
                    - The tower weighs around 14,500 tons.<br>
                    </p>
                `,
                'Amalfi Coast': `
                    <h3>More About Amalfi Coast</h3>
                    <div class="image-slider">
                        <img src="/images/amalfi-coast1.jpg" alt="Amalfi Coast Extra Image 1" class="slider-image">
                        <img src="/images/amalfi-coast2.jpg" alt="Amalfi Coast Extra Image 2" class="slider-image">
                        <img src="/images/amalfi-coast3.jpg" alt="Amalfi Coast Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    The Amalfi Coast is a UNESCO World Heritage Site located along the southern edge of Italy's Sorrentine Peninsula. Famous for its stunning coastline, picturesque villages, and Mediterranean views, the Amalfi Coast attracts millions of visitors each year who come to enjoy its natural beauty, historic sites, and coastal charm.
                    </p>
                    <p>
                    <strong>Scenic Beauty:</strong><br>
                    The Amalfi Coast is renowned for its dramatic cliffs, crystal-clear waters, and colorful villages perched above the coastline. The road along the coast offers breathtaking views of the sea and mountains, with winding paths connecting towns like Positano, Ravello, and Amalfi.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can explore the historic towns, enjoy local cuisine, or take a boat trip to admire the stunning coastline. The region is also known for its lemon groves, and visitors can sample the famous Limoncello liqueur.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - The Amalfi Coast has been a popular destination for centuries, with many wealthy families building villas along the coast.<br>
                    - Positano, one of the most famous towns on the coast, has been a tourist magnet since the 1950s.<br>
                    - The coast is also known for its hiking trails, including the Path of the Gods.<br>
                    - Amalfi was once a powerful maritime republic, competing with Venice and Genoa.<br>
                    </p>
                `,
                'Vatican City': `
                    <h3>More About Vatican City</h3>
                    <div class="image-slider">
                        <img src="/images/vatican-city1.jpg" alt="Vatican City Extra Image 1" class="slider-image">
                        <img src="/images/vatican-city2.jpg" alt="Vatican City Extra Image 2" class="slider-image">
                        <img src="/images/vatican-city3.jpg" alt="Vatican City Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    Vatican City is an independent city-state enclaved within Rome, Italy. It is the spiritual and administrative center of the Roman Catholic Church, home to the Pope, and is known for its artistic and architectural significance, including St. Peter's Basilica, the Sistine Chapel, and the Vatican Museums.
                    </p>
                    <p>
                    <strong>Art and Architecture:</strong><br>
                    The Vatican is home to some of the world's most famous art, including Michelangelo's Sistine Chapel ceiling. The Vatican Museums house an immense collection of art and sculptures, making it one of the largest museums in the world.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors to Vatican City can tour St. Peter's Basilica, the Vatican Museums, and the Sistine Chapel, experiencing the grandeur and religious significance of the site. The Vatican Gardens and St. Peter's Square are also must-see attractions.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - Vatican City is the smallest independent state in the world, covering just 44 hectares.<br>
                    - It is an entirely sovereign state, with the Pope as the head of state.<br>
                    - The Vatican's art collection includes works by Raphael, Leonardo da Vinci, and Caravaggio.<br>
                    - Over 6 million people visit Vatican City each year.<br>
                    </p>
                `,

                
         // PLACES FROM AUSTRALIA
                'Sydney Opera House': `
                    <h3>More About Sydney Opera House</h3>
                    <div class="image-slider">
                        <img src="/images/sydney-opera-house1.jpg" alt="Sydney Opera House Extra Image 1" class="slider-image">
                        <img src="/images/sydney-opera-house2.jpg" alt="Sydney Opera House Extra Image 2" class="slider-image">
                        <img src="/images/sydney-opera-house3.jpg" alt="Sydney Opera House Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    The Sydney Opera House is one of the most recognizable landmarks in the world, located on Bennelong Point in Sydney Harbour. Designed by Danish architect Jørn Utzon, it opened in 1973 and has since become a symbol of Australia. It is renowned for its unique shell-like design and is a UNESCO World Heritage Site.
                    </p>
                    <p>
                    <strong>Architecture:</strong><br>
                    The Opera House is an architectural masterpiece with its soaring white sails, which have become synonymous with Sydney's skyline. The building's innovative design and use of concrete shells make it an iconic structure in modern architecture.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can take guided tours to explore the interior of the Opera House, attend performances, or simply enjoy the views of Sydney Harbour. The venue hosts a wide range of performances, including opera, theatre, music concerts, and ballet.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - The Sydney Opera House was designed after a global competition in 1957.<br>
                    - The construction took 15 years and cost more than anticipated.<br>
                    - It hosts more than 1,500 performances every year.<br>
                    - The Opera House’s sails were inspired by the design of a ship’s sails, reflecting the city's maritime heritage.<br>
                    </p>
                `,
                'Great Barrier Reef': `
                    <h3>More About Great Barrier Reef</h3>
                    <div class="image-slider">
                        <img src="/images/great-barrier-reef1.jpg" alt="Great Barrier Reef Extra Image 1" class="slider-image">
                        <img src="/images/great-barrier-reef2.jpg" alt="Great Barrier Reef Extra Image 2" class="slider-image">
                        <img src="/images/great-barrier-reef3.jpg" alt="Great Barrier Reef Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    The Great Barrier Reef, located off the coast of Queensland, Australia, is the largest coral reef system in the world, spanning over 2,300 kilometers. It is a UNESCO World Heritage Site and one of the Seven Natural Wonders of the World. The reef is home to diverse marine life, including over 1,500 species of fish and 400 types of coral.
                    </p>
                    <p>
                    <strong>Marine Life:</strong><br>
                    The Great Barrier Reef is a haven for marine biodiversity, offering rich underwater ecosystems. It is an ideal destination for snorkeling and scuba diving, where visitors can encounter colorful coral gardens, tropical fish, sea turtles, and even dolphins and whales.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can explore the reef by boat, helicopter, or underwater submersible. Many tour companies offer day trips to the reef, where you can snorkel, dive, or simply enjoy the views from the boat. Several islands along the reef also offer luxurious resort accommodations.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - The Great Barrier Reef is visible from space and stretches over 2,300 kilometers.<br>
                    - It is home to around 400 billion individual coral polyps.<br>
                    - The reef supports thousands of species of marine life, many of which are endangered.<br>
                    - It generates billions of dollars for the Australian economy through tourism.<br>
                    </p>
                `,
                'Uluru': `
                    <h3>More About Uluru</h3>
                    <div class="image-slider">
                        <img src="/images/uluru1.jpg" alt="Uluru Extra Image 1" class="slider-image">
                        <img src="/images/uluru2.jpg" alt="Uluru Extra Image 2" class="slider-image">
                        <img src="/images/uluru3.jpg" alt="Uluru Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    Uluru, also known as Ayers Rock, is a massive sandstone monolith located in the heart of the Australian Outback. It is one of Australia's most famous landmarks and holds deep cultural significance for the Anangu, the local Indigenous people. Uluru is a UNESCO World Heritage Site and is recognized for its spiritual and historical importance.
                    </p>
                    <p>
                    <strong>Natural Beauty:</strong><br>
                    The rock is 348 meters high and has a circumference of 9.4 kilometers. Its rich red color changes dramatically at sunrise and sunset, creating a stunning visual experience. The surrounding area is equally captivating, with desert landscapes and rare wildlife.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can explore the base of Uluru and take part in guided walks or cultural tours that provide insight into the history and significance of the site. The nearby Kata Tjuta (the Olgas) also offers spectacular rock formations and hiking opportunities.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - Uluru is over 550 million years old.<br>
                    - The rock is sacred to the Anangu people, and climbing it was prohibited in 2019.<br>
                    - The colors of Uluru change with the time of day and the weather, making it a popular spot for photographers.<br>
                    - It stands as one of the largest monoliths in the world.<br>
                    </p>
                `,
                'Bondi Beach': `
                    <h3>More About Bondi Beach</h3>
                    <div class="image-slider">
                        <img src="/images/bondi-beach1.jpg" alt="Bondi Beach Extra Image 1" class="slider-image">
                        <img src="/images/bondi-beach2.jpg" alt="Bondi Beach Extra Image 2" class="slider-image">
                        <img src="/images/bondi-beach3.jpg" alt="Bondi Beach Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    Bondi Beach is one of the most famous beaches in Australia, located in the eastern suburbs of Sydney. Known for its golden sands and perfect surfing waves, Bondi Beach is a popular destination for both locals and tourists. It is a vibrant cultural hub with a relaxed atmosphere and stunning natural beauty.
                    </p>
                    <p>
                    <strong>Beach and Surf Culture:</strong><br>
                    Bondi Beach is renowned for its surf culture, and it is a great spot for beginners and experienced surfers alike. The Bondi to Coogee coastal walk is another popular attraction, offering stunning views of the ocean and surrounding coastline.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can relax on the beach, swim in the safe designated areas, or enjoy a variety of cafes and restaurants along the promenade. The Bondi Icebergs Pool, located at the southern end of the beach, is a popular spot for swimming year-round.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - Bondi Beach is one of the most photographed beaches in the world.<br>
                    - The beach was named after the Aboriginal word "Bondi," meaning "water breaking over rocks."<br>
                    - The Bondi Surf Bathers' Life Saving Club was founded in 1907.<br>
                    - Bondi Beach attracts more than 2 million visitors each year.<br>
                    </p>
                `,
                'Kakadu National Park': `
                    <h3>More About Kakadu National Park</h3>
                    <div class="image-slider">
                        <img src="/images/kakadu-national-park1.jpg" alt="Kakadu National Park Extra Image 1" class="slider-image">
                        <img src="/images/kakadu-national-park2.jpg" alt="Kakadu National Park Extra Image 2" class="slider-image">
                        <img src="/images/kakadu-national-park3.jpg" alt="Kakadu National Park Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    Kakadu National Park, located in the Northern Territory of Australia, is a vast UNESCO World Heritage-listed site known for its rich biodiversity, ancient rock art, and diverse landscapes. It spans over 19,000 square kilometers and is home to various ecosystems, including wetlands, forests, and rugged escarpments.
                    </p>
                    <p>
                    <strong>Wildlife and Nature:</strong><br>
                    Kakadu is home to an incredible array of wildlife, including saltwater crocodiles, kangaroos, wallabies, and over 280 species of birds. The park also features numerous natural attractions, including waterfalls, billabongs, and ancient rock formations.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can explore the park through guided tours, bush walks, and scenic drives. Popular attractions include Jim Jim Falls, Ubirr Rock, and the Nourlangie Rock art site. The park is also a haven for birdwatchers and nature lovers.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - Kakadu is home to some of the oldest and most significant Aboriginal rock art in the world.<br>
                    - The park is also a haven for migratory birds, especially during the wet season.<br>
                    - Kakadu was listed as a UNESCO World Heritage Site in 1981.<br>
                    - The park is also famous for its stunning waterfalls, especially during the wet season.<br>
                    </p>
                `,
                
                
                
              //PLACES FROM BRAZIL
                'Christ the Redeemer': `
                    <h3>More About Christ the Redeemer</h3>
                    <div class="image-slider">
                        <img src="/images/christ-the-redeemer1.jpg" alt="Christ the Redeemer Extra Image 1" class="slider-image">
                        <img src="/images/christ-the-redeemer2.jpg" alt="Christ the Redeemer Extra Image 2" class="slider-image">
                        <img src="/images/christ-the-redeemer3.jpg" alt="Christ the Redeemer Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    Christ the Redeemer is a towering statue of Jesus Christ located atop Corcovado Mountain in Rio de Janeiro, Brazil. Completed in 1931, this iconic monument stands 98 feet tall and has become a global symbol of Christianity and a cultural symbol of Brazil.
                    </p>
                    <p>
                    <strong>Design and Architecture:</strong><br>
                    Designed by Brazilian engineer Heitor da Silva Costa and sculpted by French artist Paul Landowski, the statue is made of reinforced concrete and soapstone. It has a sweeping 92-foot wingspan, giving it a monumental presence. Christ the Redeemer is one of the New Seven Wonders of the World.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can reach the top of Corcovado Mountain via a scenic train ride or hike through the Tijuca Forest. The panoramic views from the summit are breathtaking, offering a sweeping look at Rio de Janeiro, Sugarloaf Mountain, and the Atlantic Ocean.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - Christ the Redeemer was completed in 1931, taking nine years to build.<br>
                    - The statue is one of the largest of its kind in the world.<br>
                    - It stands 2,300 feet above sea level.<br>
                    - It is a popular spot for religious and cultural gatherings.<br>
                    </p>
                `,
                'Amazon Rainforest': `
                    <h3>More About Amazon Rainforest</h3>
                    <div class="image-slider">
                        <img src="/images/amazon-rainforest1.jpg" alt="Amazon Rainforest Extra Image 1" class="slider-image">
                        <img src="/images/amazon-rainforest2.jpg" alt="Amazon Rainforest Extra Image 2" class="slider-image">
                        <img src="/images/amazon-rainforest3.jpg" alt="Amazon Rainforest Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    The Amazon Rainforest, spanning over 5.5 million square kilometers, is the largest tropical rainforest in the world, covering much of northern Brazil. This region is known for its rich biodiversity, hosting approximately 390 billion trees and thousands of animal and plant species.
                    </p>
                    <p>
                    <strong>Flora and Fauna:</strong><br>
                    The Amazon Rainforest is home to a vast array of wildlife, including jaguars, sloths, river dolphins, and countless species of birds and insects. It is also a crucial source of oxygen, often referred to as the "lungs of the Earth." It contains around 10% of the world’s known species.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can take guided tours into the heart of the Amazon, where they can explore its dense jungle, navigate its waterways by boat, and visit indigenous communities. Eco-lodges offer immersive stays where travelers can learn about the region’s environment and conservation efforts.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - The Amazon is home to the largest river by discharge volume of water in the world, the Amazon River.<br>
                    - It contains around 400 billion individual trees, representing over 16,000 different species.<br>
                    - The rainforest produces 20% of the world's oxygen.<br>
                    - It plays a critical role in regulating the Earth’s climate.<br>
                    </p>
                `,
                'Iguazu Falls': `
                    <h3>More About Iguazu Falls</h3>
                    <div class="image-slider">
                        <img src="/images/iguazu-falls1.jpg" alt="Iguazu Falls Extra Image 1" class="slider-image">
                        <img src="/images/iguazu-falls2.jpg" alt="Iguazu Falls Extra Image 2" class="slider-image">
                        <img src="/images/iguazu-falls3.jpg" alt="Iguazu Falls Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    Iguazu Falls, located on the border between Brazil and Argentina, is one of the largest and most impressive waterfall systems in the world. It consists of approximately 275 individual waterfalls, cascading over a distance of 2.7 kilometers. The falls are surrounded by lush rainforests and are a UNESCO World Heritage Site.
                    </p>
                    <p>
                    <strong>Natural Beauty:</strong><br>
                    The falls are a breathtaking sight, with water plunging into deep gorges and creating powerful spray. The surrounding Iguazu National Park is home to diverse flora and fauna, including toucans, jaguars, and numerous species of butterflies.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can explore both the Brazilian and Argentine sides of the falls, each offering unique perspectives. Hiking trails and boat tours take visitors close to the waterfalls, and helicopter tours provide a bird's-eye view of the magnificent landscape.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - Iguazu Falls is one of the largest waterfall systems in the world, surpassing even Niagara Falls in volume.<br>
                    - The falls are formed by the Iguazu River, which flows from the Paraná Plateau.<br>
                    - The name "Iguazu" comes from the Guarani or Tupi language, meaning "big water."<br>
                    - The falls are part of a protected national park shared by Brazil and Argentina.<br>
                    </p>
                `,
                'Copacabana Beach': `
                    <h3>More About Copacabana Beach</h3>
                    <div class="image-slider">
                        <img src="/images/copacabana-beach1.jpg" alt="Copacabana Beach Extra Image 1" class="slider-image">
                        <img src="/images/copacabana-beach2.jpg" alt="Copacabana Beach Extra Image 2" class="slider-image">
                        <img src="/images/copacabana-beach3.jpg" alt="Copacabana Beach Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    Copacabana Beach is one of the most famous beaches in the world, located in Rio de Janeiro. Known for its vibrant atmosphere and long stretch of golden sand, Copacabana is a popular destination for tourists and locals alike. The beach is a symbol of Rio's culture and lifestyle.
                    </p>
                    <p>
                    <strong>Beach Activities:</strong><br>
                    Copacabana is famous for its lively beach culture, offering activities such as beach volleyball, soccer, surfing, and swimming. The beach promenade is lined with cafes, restaurants, and bars, making it a great place to relax and enjoy the view.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can enjoy leisurely walks along the beach, swim in the warm waters, or attend various events held throughout the year, such as the New Year's Eve celebrations. The beach also offers a view of the iconic Sugarloaf Mountain and the nearby fortresses.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - Copacabana Beach is 4 kilometers long.<br>
                    - It hosts one of the largest New Year's Eve parties in the world.<br>
                    - The beach's iconic black-and-white tile pattern was designed by artist Roberto Burle Marx.<br>
                    - Over 2 million people visit Copacabana Beach every year.<br>
                    </p>
                `,
                'Sugarloaf Mountain': `
                    <h3>More About Sugarloaf Mountain</h3>
                    <div class="image-slider">
                        <img src="/images/sugarloaf-mountain1.jpg" alt="Sugarloaf Mountain Extra Image 1" class="slider-image">
                        <img src="/images/sugarloaf-mountain2.jpg" alt="Sugarloaf Mountain Extra Image 2" class="slider-image">
                        <img src="/images/sugarloaf-mountain3.jpg" alt="Sugarloaf Mountain Extra Image 3" class="slider-image">
                        <span class="slider-nav left" onclick="moveSlide(-1)">&#10094;</span>
                        <span class="slider-nav right" onclick="moveSlide(1)">&#10095;</span>
                    </div>
                    <p>
                    <strong>History and Importance:</strong><br>
                    Sugarloaf Mountain (Pão de Açúcar) is one of Rio de Janeiro's most recognizable landmarks, rising 396 meters above the harbor. The granite peak offers panoramic views of the city, its beaches, and the surrounding bay.
                    </p>
                    <p>
                    <strong>Visiting Experience:</strong><br>
                    Visitors can take a two-stage cable car ride to the top of Sugarloaf Mountain, where they are rewarded with stunning 360-degree views of Rio, including Copacabana Beach, Christ the Redeemer, and the nearby islands. The cable car journey is an unforgettable experience.
                    </p>
                    <p>
                    <strong>Interesting Facts:</strong><br>
                    - Sugarloaf Mountain got its name from the resemblance to traditional sugarloafs.<br>
                    - The cable car to the summit first opened in 1912, making it one of the oldest in the world.<br>
                    - The mountain offers some of the best views of Rio’s skyline.<br>
                    - It is a popular spot for photography, especially during sunset.<br>
                    </p>
                `

        };
        return detailsMap[placeName] || '<p>No additional details available.</p>';
    }

    // Slider logic
    let slideIndex = 0;

    function moveSlide(n) {
        const images = document.querySelectorAll('.slider-image');
        const totalSlides = images.length;
        slideIndex += n;

        if (slideIndex >= totalSlides) {
            slideIndex = 0;
        } else if (slideIndex < 0) {
            slideIndex = totalSlides - 1;
        }

        for (let i = 0; i < totalSlides; i++) {
            images[i].style.display = 'none';
        }
        images[slideIndex].style.display = 'block';
    }
</script>

</body>
</html>
