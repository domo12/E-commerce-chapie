-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Apr 28, 2023 at 05:05 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chapie`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
CREATE TABLE IF NOT EXISTS `cart_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `id` (`product_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_item`
--

INSERT INTO `cart_item` (`id`, `product_id`, `customer_id`, `quantity`) VALUES
(21, '6', '4', 1),
(13, '72', '7', 2),
(14, '44', '7', 7),
(22, '60', '4', 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `category_image_directory` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `category_image_directory`) VALUES
(1, 'food', 'icon\\category\\food.png'),
(2, 'moblies & accessories', 'icon\\category\\game.png'),
(3, 'health & beauty', 'icon\\category\\health.png'),
(4, 'baby & toys', 'icon\\category\\baby.png'),
(5, 'men cloth', 'icon\\category\\mencloth.png'),
(6, 'womencloth', 'icon\\category\\womencloth.png'),
(7, 'home appliances', 'icon\\category\\home.png'),
(8, 'women shoe', 'icon\\category\\womenshoes.png'),
(9, 'sport & outdoor', 'icon\\category\\sport.png'),
(10, 'automotive', 'icon\\category\\automotive.png'),
(11, 'bags', 'icon\\category\\bags.png'),
(12, 'men shoe', 'icon\\category\\menshoes.png');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

DROP TABLE IF EXISTS `contact_us`;
CREATE TABLE IF NOT EXISTS `contact_us` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `subject`, `description`, `customer_name`, `customer_email`) VALUES
(1, 'product undeliverd', 'prodcut does not deliver on time', 'abc', 'abc@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`user_id`, `user_name`, `email`, `password`) VALUES
(1, 'Jayden Rowan', 'JRowan@gmail.com', 'J1123'),
(2, 'Oliva Noah', 'Olivia@gmail.com', 'Oli0112'),
(4, 'abc', 'abc@gmail.com', 'abc'),
(5, 'domo', 'domo@gmail.com', '123'),
(6, 'ong', 'ong@gmail.com', '1234'),
(7, 'yl', 'yeeling888@gmail.com', 'yeeling888');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_details`
--

DROP TABLE IF EXISTS `delivery_details`;
CREATE TABLE IF NOT EXISTS `delivery_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `delivery_id` varchar(100) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_delivery_id` (`delivery_id`),
  KEY `FK_product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `delivery_details`
--

INSERT INTO `delivery_details` (`id`, `delivery_id`, `product_id`, `status`) VALUES
(4, '5', '28', 'processing'),
(3, '2', '6', 'processing'),
(5, '5', '45', 'processing'),
(6, '5', '6', 'processing'),
(7, '5', '42', 'processing'),
(8, '5', '28', 'processing'),
(9, '5', '45', 'processing'),
(10, '5', '6', 'processing'),
(11, '5', '42', 'processing');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_items`
--

DROP TABLE IF EXISTS `delivery_items`;
CREATE TABLE IF NOT EXISTS `delivery_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_delivery_items_customer_id` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `delivery_items`
--

INSERT INTO `delivery_items` (`id`, `customer_id`) VALUES
(3, '4'),
(5, '1');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int NOT NULL,
  `image_directory` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `price`, `category_id`, `image_directory`) VALUES
(1, 'Sin Boon Kee Penang Kopi-O (No Sugar / Kosong) 新文记槟榔屿传统咖啡乌 (无糖) [15g x 20 sachets]', 'READY STOCK \n3DAY SHIPMENT DAY \nMEASUREMENT:\nLONG 25CM X HEIGHT 19CM X WIDTH 11CM', '8.50', 1, 'icon\\product\\Catogories\\Food\\1.jpg'),
(2, 'Satin Fabric / Pongee Fabric Solid Color Decoration\n', 'This is a cloth', '15.30', 5, 'icon\\product\\Catogories\\Men Clothes\\2.png'),
(6, 'Tomyam Soup Mee Hoon', 'sour, mildly spicy, and very creamy. It were prepared with seafood such as squid, prawns and clams.', '12.90', 10, 'icon\\product\\Catogories\\Food\\Tomyum Soup Mee Hoon.jpg'),
(7, 'Asam Laksa', 'asam laksa is made on tamarind as a based. sourer in flavour than curry laksa made with coconut', '13.90', 10, 'icon\\product\\Catogories\\Food\\Asam Laksa.jpg'),
(8, 'Curry Mee', 'spicy flavour and the rich taste of the gravy', '12.90', 10, 'icon\\product\\Catogories\\Food\\Curry Mee.jpg'),
(9, 'Seafood Soup', 'This chowder is a filling, herbaceous meal-in-a-bowl made with fish, prawn, and tonnes of chopped vegetables.', '20.90', 10, 'icon\\product\\Catogories\\Food\\Seafood Soup.jpg'),
(14, 'Fried Chicken', 'Its taste juicy, succulent, tender and tasty.', '15.60', 10, 'icon\\product\\Catogories\\Food\\Fried Chicken.jpg'),
(25, 'Shampoo', 'Increase hair volumn, with coconut oil', '85.00', 3, 'icon\\product\\Catogories\\Health & Beauty\\Shampoo.jpg'),
(26, 'Whitening Mask', 'Delivers the advantages of a 20-minute sheet mask in just 8 minutes to defend against pigmentation and enhance luminous skin.', '6.90', 3, 'icon\\product\\Catogories\\Health & Beauty\\Whitening Mask.webp'),
(27, 'Fish oil', 'Provide Omega-3s contribute to typical brain and eye development. They fight inflammation and may help prevent heart disease and a decline in brain function. ', '51.50', 3, 'icon\\product\\Catogories\\Health & Beauty\\Fish oil.jpg'),
(28, 'Liquid lipstick', 'Liquid, Stick, Hydrating, Long-wearing', '59.00', 3, 'icon\\product\\Catogories\\Health & Beauty\\Liquid Lipstick.webp'),
(29, 'Liquid foundation', 'The matte foundations ultra-lightweight composition has flexible micro-powders to control shine and blur pores throughout the day, making it perfect for skin types with normal to oily t-zones.', '89.00', 3, 'icon\\product\\Catogories\\Health & Beauty\\Liquid foundation.jpg'),
(39, 'Wireless Earphone', 'Wireless Bluetooth 5.0 Earphone Stereo In Ear Headset Earphone Handsfree Sports Earbuds', '115.90', 2, 'icon\\product\\Catogories\\Mobiles & Accessories\\Bluetooth smart watch.jpg'),
(40, 'USB Cable', '100W Aluminum shell Nylon Type C Fast Charger USB Cable', '8.50', 2, 'icon\\product\\Catogories\\Mobiles & Accessories\\USB Cable.webp'),
(41, 'Powerbank', '20000mAh 30W Metal Smart Digital Display Quick Charge Power Bank High Power Dual Way Fast Charge', '127.90', 2, 'icon\\product\\Catogories\\Mobiles & Accessories\\Powerbank.png'),
(42, 'Phone case', 'Casing Protect Cover Shell', '6.20', 2, 'icon\\product\\Catogories\\Mobiles & Accessories\\Phone case.jpg'),
(43, 'Bluetooth smart watch', 'Full Touch Screen Sports Watch. Function: Pedometer, Custom dial, Music control function, Bluetooth call, Calls Reminder, Social APP reminder, Messages Reminder, Sedentary reminder, Blood Pressure, Blood Oxygen, Sleep mode, Sport Mode, Alarm, Play the music, Stopwatch', '125.60', 2, 'icon\\product\\Catogories\\Mobiles & Accessories\\Wireless Earphone.webp'),
(44, 'Baby shirt', 'organic cotton rompers short sleeve baby shirt', '37.50', 4, 'icon\\product\\Catogories\\Baby & Toys\\Baby Shirt.jpg'),
(45, 'Baby car seat', 'A seat designed specifically to protect children from injury or death during vehicle collisions.  \r\n1. Provides the highest level of comfort.\r\n2. Reduces heating up in hot weather – thus preventing your baby’s sensitive skin from getting hurt. \r\n3. central harness adjuster enables the child to be fastened into the seat securely and simply.\r\n4. It can be adjusted to multiple positions.', '599.00', 4, 'icon\\product\\Catogories\\Baby & Toys\\Baby Car Seat.jpg'),
(48, 'Rotating Music Piano Educational Toy', '1. Made of high-quality plastic, the surface is safe, smooth, long-lasting, and wont cut the babys hands, allowing for quiet play.\r\n2. A baby will be drawn to the distinctive design, soft lighting, and soothing music.\r\n3. Small size, portable, and baby-friendly.\r\n4. Parents can play with their kids to strengthen the bond between them.', '28.90', 4, 'icon\\product\\Catogories\\Baby & Toys\\Rotating Music Piano Educational Toy.webp'),
(49, 'Baby Diaper', 'Extremely long, 12-hour shifts that are dry,\r\n1) Speed Air Wave sheets quickly absorb to keep the bottom entirely dry.\r\n2) Stretchy gathers ensure a tight fit and stop leaks\r\n3) To prevent rash, all-around airflow releases heat and moisture.\r\n4) Wrap tape in rolls for simple disposal\r\n5) The gender distinction in boy and girl designs', '41.90', 4, 'icon\\product\\Catogories\\Baby & Toys\\Baby Diaper.jpg'),
(50, 'Baby Rattle', '1. Little coloured beads that are built in can stimulate newborns hear better.\r\n2. Materials that are reliable. Food-grade silicone is used to make the teething toys for babies. The infant grasp toys are softer and less dangerous to handle and chew. They may be disinfected immediately for no longer than one minute in boiling water.\r\n3. Safe & Soft for Relief from Teething. Toy rattles for newborns are constructed of food-grade silicone. BPA-free, odourless, and non-toxic. The infant grasp toys are softer and less dangerous to handle and chew.', '12.90', 4, 'icon\\product\\Catogories\\Baby & Toys\\Baby Rattle.jpg'),
(52, 'Hoodie', 'crafted with top-notch materials that will keep you cosy and comfy throughout the entire season. The stitching is strong, and the fabric is thick and silky.', '55.90', 5, 'icon\\product\\Catogories\\Men Clothes\\Hoodie.jpg'),
(53, 'Jacket', ' a type of outerwear garment that is designed to provide warmth and protection from the elements. Jackets can be worn for both casual and formal occasions.', '69.90', 5, 'icon\\product\\Catogories\\Men Clothes\\Jacket.webp'),
(54, 'Suit', 'a set of clothes comprising a suit jacket and trousers of identical textiles worn with a collared dress shirt, necktie, and dress shoes.', '817.00', 5, 'icon\\product\\Catogories\\Men Clothes\\Suit.webp'),
(55, 'Sweater', 'The crewneck shape is made of 100% wool and has contrast trims and a logo label embroidered to the back.', '80.00', 5, 'icon\\product\\Catogories\\Men Clothes\\Sweater.png'),
(56, 'Blouse', 'early spring casual blouse with a free draping\r\n1. A simple yet fashionable V-neck chiffon flowy top-s shirt.\r\n2. The wide and stylish long sleeve can be rolled up.\r\n3. Appropriate for workplace women to go with a dress or trousers.]', '43.00', 6, 'icon\\product\\Catogories\\Women Cloth\\Blouse.jpg'),
(57, 'Tank top', 'Slarge and sturdy straps. Especially, the shirt is sewn with 2 layers of fabric, with the technique of turning the fabric to hide the seam, without revealing the thread.\r\n- Material: Zip cotton ribbed elastic. \r\n- Material: cotton.', '28.00', 6, 'icon\\product\\Catogories\\Women Cloth\\Tank top.jpg'),
(58, 'Skirt', 'Features:\r\n1. Knitted midi skirt with a solid high waist.\r\n2. Stylish, chic, and delectable. Excellent for parties, weddings, or casual wear.', '33.90', 6, 'icon\\product\\Catogories\\Women Cloth\\Skirt.jpg'),
(59, 'Jeans', 'present a super fashion street styles jean. Few clothing items can make the claim to be as flattering and versatile as this one. Jeans go with any outfit in a womans closet and are appropriate for both a relaxed Sunday and a day at the workplace.', '77.00', 6, 'icon\\product\\Catogories\\Women Cloth\\Jeans.jpg'),
(60, 'Romper', 'This romper is made of silky denim and has cuffed sleeves and casual collars. tied in at the front with a fixed sash. features front zip fastening and useful pockets.', '99.00', 6, 'icon\\product\\Catogories\\Women Cloth\\Romper.jpg'),
(61, 'Refrigerator', '1. Perishable food remains wet and fresh in a refrigerator with a high humidity level.\r\n2. The freezer receives a quick burst of chilly air thanks to Power Freeze. to rapidly cool your purchases or beverages of choice.\r\n3. The Fresh Zone drawer, which has a clever design and a tight closure, provides the perfect atmosphere for preserving perishable foods.', '3899.00', 7, 'icon\\product\\Catogories\\Home & Appliances\\Refrigerator.png'),
(62, 'Microwave', '1.  Its automatic defrost algorithm calculates the correct defrosting time for 5 common food types, so it takes much less time to prepare ingredients.\r\n2. Keep Warm function keeps everything at the proper temperature without over-cooking, using a grill heater\r\n3. ECO Mode significantly reduces energy consumption with the  lower standby power.', '379.00', 7, 'icon\\product\\Catogories\\Home & Appliances\\Microwave.jpg'),
(63, 'Washing machine', '1. Washing should take significantly less time. Detergent penetrates more rapidly and washes more quickly and softly thanks to the plentiful and potent bubbles that are produced by the dynamic drum rotation and additional water jets.\r\n2. Use steam to thoroughly and hygienically clean clothing. Without using any pre-treatments, a hygiene steam cycle enhances the cleaning quality of your wash.\r\n3. Maintain clothing germ-free without using water or detergent. Your clothing always smell fresh thanks to the deodorising and sanitising effects of Air Wash technology.', '3599.00', 7, 'icon\\product\\Catogories\\Home & Appliances\\Washing Machine.png'),
(64, 'Dishwasher', 'Dishes are hygienically cleaned at 70°C, which uses less water and less effort to sterilise germs with an antibacterial filter. intelligently adjusts water and electricity use based on the results of its automatic soil level detection in order to provide clean, fresh dinnerware at a lesser cost.', '1899.00', 7, 'icon\\product\\Catogories\\Home & Appliances\\Dishwasher.png'),
(65, 'Coffee maker', 'Use the Mainstays Black 5-Cup Coffee Machine with Removable Filter Basket to get your day off to a good start. Simply add some water and your preferred coffee powder to the coffee maker. Then turn on the switch and let it run!\r\n1. Up to 5 cups of coffee can be brewed using the device.\r\n2. In addition, the auto stay warm feature will guarantee that your refill will be equally delicious as your first mug.\r\n3. The unit is simple to use and has a straightforward power button design.', '599.00', 7, 'icon\\product\\Catogories\\Home & Appliances\\Coffee maker.webp'),
(72, 'Heels', 'The thin straps gracefully loop the toe over the square toe box, seamlessly transforming from day to night and exuding a classy yet laid-back vibe.', '249.50', 8, 'icon\\product\\Catogories\\Women Shoe\\Heels.jpg'),
(73, 'Mary Jane', 'These crochet and leather Mary Jane shoes, which put a stylish spin on the traditional feminine shoe shape. They come in classic black for optimum adaptability and have a crocheted outer layer for extra texture and aesthetic intrigue. These shoes are simple to put on and are cosy enough to wear all day thanks to their adjustable straps and low block heels. This pair is undoubtedly built to last because it is constructed of genuine leather.', '299.00', 8, 'icon\\product\\Catogories\\Women Shoe\\Mary Jane.jpg'),
(74, 'platform shoes', 'The Berlin Heels are what you get when a timeless classic combines with a hearty dose of modernism. This beautiful beige item, which draws inspiration from both the past and the present, embodies thoughtful design and offers a modern take on modern life. This is a shoe for fashion connoisseurs because it has a flawlessly stitched upper and a chunky raised sole for added urban appeal.', '289.00', 8, 'icon\\product\\Catogories\\Women Shoe\\Platform shoes.jpg'),
(75, 'Ankle boots', 'The Leather Chelsea Boots in black combine the greatest features of dress and casual footwear. They are made from soft, smooth calf leather and have elasticized side panels for a closer fit. You will always look good whether youre dressed up or down because to the sleek designs urban sophistication.', '499.00', 8, 'icon\\product\\Catogories\\Women Shoe\\Ankle boots.jpg'),
(76, 'Mules', 'The Blake Leather Penny Loafer Mules in camel are simple to wear and adaptable in style. This slip-on is accented with a rounded toe and penny strap for a trendy design, helping you to keep ahead of the trend. It is made of leather for an opulent look and feel.', '379.00', 8, 'icon\\product\\Catogories\\Women Shoe\\Mules.jpg'),
(77, 'Golf', 'This 4-club set was created by golf designers to teach the game to children between the ages of 8 and 10 who are between 1.25m and 1.40m tall.\r\n', '999.00', 9, 'icon\\product\\Catogories\\Sport & Outdoor\\Golf.jpg'),
(78, 'Hiking pole', 'This anti-shock pole is intended for avid hikers and trekkers who frequently practise on difficult mountain terrain.\r\nShock-absorbing pole to lessen impact on joints. You have complete control over when to disable the shock absorber.', '89.00', 9, 'icon\\product\\Catogories\\Sport & Outdoor\\Hiking pole.png'),
(79, 'Camping tent', 'This camping tent has areas that are roomy and tall. If you want a cool, dark place to sleep, this camping tent is suitable for you. The assisted folding technique puts an end to the stress of leaving.', '399.00', 9, 'icon\\product\\Catogories\\Sport & Outdoor\\Camping Tent.jpg'),
(80, 'Snowboard', '1. For beginners and those beginning to snowplough, soft, forgiving skis are ideal.\r\n2. These skis give improved grip and stability during parallel turning, making them ideal for individuals who ski green and easy blue runs.\r\n3. Burtons beginner- and novice-specific snowboards are made to speed up learning and reduce mistakes.', '664.20', 9, 'icon\\product\\Catogories\\Sport & Outdoor\\snowboard.jpg'),
(81, 'Pilates stretching balance board', 'This item will assist you in maintaining your equilibrium, recovering from damage, and preventing further harm (ankles, knees).', '69.00', 9, 'icon\\product\\Catogories\\Sport & Outdoor\\Pilates stretching balance board.png'),
(82, 'Soccer', 'The football has Messi branding and a striking graphic that honours the Argentineans destructive style of play. A butyl bladder and machine-stitched casing provide the durability necessary for frequent use during workouts and park kickarounds.', '34.99', 9, 'icon\\product\\Catogories\\Sport & Outdoor\\Soccer.jpg'),
(83, 'Car air filter', 'Benefits of the product include: \r\n1. quiet operation, small size, high power, safety\r\n2.  removal of formaldehyde and other VOCs from the air in your car, truck, or RV in less than six minutes.', '599.00', 10, 'icon\\product\\Catogories\\Automotive\\Car air filter.png'),
(84, 'Car battries', 'a battery that can be charged up and is used to start cars. Its primary function is to supply an electric current to the electric starting motor, which in turn ignites the internal combustion engine that powers the vehicles propulsion system.', '245.00', 10, 'icon\\product\\Catogories\\Automotive\\Car batteries.jpg'),
(85, 'Car fuel filter', 'To ensures that all the impurities, dirt and debris are screened from the petrol entering the engine.', '130.00', 10, 'icon\\product\\Catogories\\Automotive\\Car fuel filter.jpg'),
(86, 'Car radiators', 'A vehicles many moving parts will inevitably rub against one another, creating friction and a lot of heat. The radiator aids in the removal of some of that extra heat to keep the engine safe. Heat exchangers that are used to cool internal combustion engines.', '170.00', 10, 'icon\\product\\Catogories\\Automotive\\Car radiator.jpg'),
(87, 'Car audio systems', 'Applicable99% The automobile door horn has been updated with solderless wiring, a mounting screw plug, and a horn cover.\r\n1. function: Audio\r\n2. Rated power: 50W\r\n3. Speaker type: Coaxial horn', '125.00', 10, 'icon\\product\\Catogories\\Automotive\\Car audio systems.jpg'),
(88, 'Prive bags', 'We will provide our customers an array of products that satisfy demand for quality and efficiency.\r\nColor: Black\r\nBag Size: Medium\r\nClosure Type: Zipper', '119.00', 11, 'icon\\product\\Catogories\\Bags\\Prive bags.jpg'),
(89, 'Floral Detail Top Handle Bag', '1. A handbag made of faux leather with floral hardware\r\n2. Top handles \r\n3. Major compartments with zip closing \r\n4. 1 interior zip pocket \r\n5. 1 interior pocket sleeve', '109.00', 11, 'icon\\product\\Catogories\\Bags\\Floral Detail Top Handle Bag.png'),
(90, 'Cross body bag', '1. Composite fabric made entirely of recyclable materials\r\n2. Tough ripstop fabric and water-resistant zippers\r\n3. A strap with elasticized adjustment for simple on-and-off\r\n4. Zip pulls with shrink-wrapped lead', '129.00', 11, 'icon\\product\\Catogories\\Bags\\Cross body bag.png'),
(91, 'Messenger bag', 'The Messenger Bag embodies a mix between design and usefulness, giving off an air of charm. It holds everything neatly in a number of useful pockets and slots.\r\nFeatures: 1 Zip Pocket, 2 Pockets, 4 Card Slots, and 1 Additional External Compartment', '219.00', 11, 'icon\\product\\Catogories\\Bags\\Messenger bag.png'),
(92, 'Work bag', 'Feature Details:\r\n1. 16\" laptop sleeve with padding\r\n2. iPad tablet slip with a large zip opening for accessibility\r\n3. water bottle compartment on the side', '319.00', 11, 'icon\\product\\Catogories\\Bags\\Work bag.png'),
(93, 'Boots', 'a type of footwear that are typically designed to provide support and protection for the feet and ankles. made from a variety of materials, including leather, suede, and synthetic fabrics. They have provide features such as waterproofing or insulation for added protection and comfort.', '215.00', 12, 'icon\\product\\Catogories\\Men Shoe\\Boots.webp'),
(94, 'Dress shoe', 'It is opulently designed with a pointed square toe and is constructed of embossed burnished calf leather. Nonetheless, because of its attractive black colour, it can easily fit any classic and sophisticated style.', '319.00', 12, 'icon\\product\\Catogories\\Men Shoe\\Dress shoe.png'),
(95, 'Sandals', 'This sandal is an updated take on some of our vintage running shoes. The open mesh gives you a keeps you cool while protecting your toes and has been updated with modern design components, versatile styling, and technologies. This shoe has hook-and-loop straps and elastic heel bands for an excellent fit and simple on/off.', '115.00', 12, 'icon\\product\\Catogories\\Men Shoe\\Sandals.png'),
(96, 'Loafers', 'These timeless shoes feature a simple slip-on style. They are made to last thanks to a coating that is water- and stain-resistant. made with leather that was sourced ethically. pieces with cutting-edge designs and elegant details.', '157.00', 12, 'icon\\product\\Catogories\\Men Shoe\\Loafers.png'),
(97, 'Espadrilles', 'With these slip-on espadrilles, go for a carefree summer appearance. For a realistic appearance, they have a rope-effect sole and a canvas top. New technology help to reduces odour for a fresh feeling.', '149.90', 12, 'icon\\product\\Catogories\\Men Shoe\\Espadrilles.png'),
(98, 'BIO OIL [Skin Oil 200ml x 2 + 25ml]', 'Bio-Oil is a specialist skincare oil that helps improve the appearance of scars, stretch marks and uneven skin tone.', '128.00', 3, 'icon\\product\\Catogories\\Health & Beauty\\bioOil.jpg'),
(99, 'SALONPAS Patch 40\'s', 'Relief of aches & pains of muscles & joints associated with backache, arthritis, strains, bruises & sprains, tired feet', '19.25', 3, 'icon\\product\\Catogories\\Health & Beauty\\salonpas.jpg'),
(100, 'NESTLE NUTREN OPTIMUM 800G', 'NUTREN OPTIMUM is scientifically developed as a complete and balanced nutritional supplement to regain strength in as early as 6 weeks.', '102.31', 3, 'icon\\product\\Catogories\\Health & Beauty\\nestleNutren.jpg'),
(101, 'HEAD&SHOULDERS COOL MENTHOL SHAMPOO 480ML', 'Leaves hair up to 100% dandruff free*', '25.90', 3, 'icon\\product\\Catogories\\Health & Beauty\\headShoulders.jpg'),
(102, 'EBENE BIO-RAY KNEE GUARD SIZE L 1 pair', 'Helps To Relieve Knee Problems. Eliminates Leg Swelling. Provides Knee Support. Strengthens Bones & Soft Tissue', '171.00', 3, 'icon\\product\\Catogories\\Health & Beauty\\ebene.jpg'),
(103, 'CED ORGANIC ROLLED OAT 500GM (TWIN PACK)', 'CED Organic Rolled Oats version is steamed and then rolled into sheets all produced without chemical pesticides or fertilizers.', '19.00', 1, 'icon\\product\\Catogories\\Food\\CED.jpg'),
(104, 'NESTLE KOKO KRUNCH CEREAK 450G', 'Breakfast cereal with great, chocolate-y taste to kick start your kids school day with carbohydrates and fiber to provide energy.', '18.52', 1, 'icon\\product\\Catogories\\Food\\kokoKrunch.jpg'),
(105, 'MASTER PASTO MUSHROOM CREAM SAUCE CONVENIENCE PACK 270G', 'Master Pasto Mushroom Cream Sauce is a 3-minute restaurant-grade instant pasta meal', '8.20', 1, 'icon\\product\\Catogories\\Food\\masterPasto.jpg'),
(106, 'ORGANIC CARE2U ORGANIC CARROT NOODLE [200G x 3 PACKS]', 'Organic Care2u Organic Carrot Noodle is mainly made from Organic Unbleached Wheat flour and Fresh Carrot Powder.', '20.44', 1, 'icon\\product\\Catogories\\Food\\care2uNoodle.jpg'),
(107, 'NESCAFE PLANT BASED COFFEE  225ML', 'Organic Care2u Organic Carrot Noodle is mainly made from Organic Unbleached Wheat flour and Fresh Carrot Powder.', '3.35', 1, 'icon\\product\\Catogories\\Food\\nescafePlantBasedCoffee.jpg'),
(108, 'PUSHEEN LOUGE WEAR 1S', 'Pusheen is a tubby tabby cat who brings smiles and laughter to people all around the world. This lounge wear comes in Free Size.', '65.00', 6, 'icon\\product\\Catogories\\Women Cloth\\pusheen.jpg'),
(109, 'SOFT SNUG SAUNA T', 'Tailored for your casual training routines, the Sauna - T top is made of premium EPDM material to elevate weight loss by promoting perspiration, sweat glands detoxification, increase metabolism and fat burn by circulating body heat.', '149.00', 6, 'icon\\product\\Catogories\\Women Cloth\\saunaT.jpg'),
(110, 'C9 CHAMPION WOMEN\'S KNIT SPORT SHORT', '5\" inseam, low rise,\r\n1 duo dry - wicks moisture, dries fast', '34.90', 6, 'icon\\product\\Catogories\\Women Cloth\\championSportShort.jpg'),
(111, 'OMOONE WOMENS SLEEVE DENIM CROP TOP TIE KNOT SHIRT CARDIGIN', 'Cute lightweight distressed denim chambray jean cover ups shrug shirts for summer, spring and early autumn', '75.00', 6, 'icon\\product\\Catogories\\Women Cloth\\omooneSleeve.jpg'),
(112, 'DAZY SLOGAN GRAPHIZ DRAWSTRING TERMAL OVERSIZED HOODIE', 'the DAZY hoodie is made of 75% polyester, 25% cotton and the color is Mauve Purple', '92.00', 6, 'icon\\product\\Catogories\\Women Cloth\\dazyHoodie.jpg'),
(113, 'XIAOMI REDMI 18W FAST CHARGER (10000mAh)', '10000mAh Redmi Power Bank10000mAh capacity \r\n1 34Wh energy (3.7V, 10000mAh); Powerful and lightweight', '89.00', 2, 'icon\\product\\Catogories\\Mobiles & Accessories\\redmiPowerbank.jpg'),
(114, 'XIAOMI WIRELESS CAR CHARGER (20W)', 'Up to 20 W Fast Wireless Charging: *20W Fast Charge only compatible with Mi 9 \r\n1 Wireless Charging: Compatible with Mi Mix3, Mi Mix 2S, Iphone 8 and above, Samsung S6/Note 6 & Above', '169.00', 2, 'icon\\product\\Catogories\\Mobiles & Accessories\\wirelessCharger.jpg'),
(115, 'JETech SILICONE CASE FOR AIRTAG 2021 WITH KEYCHAIN', 'Customized for AirTag 2021. Perfectly fit your device, maximum wrap AirTag and offer great protection', '25.00', 2, 'icon\\product\\Catogories\\Mobiles & Accessories\\JeETechSiliconeCase.jpg'),
(116, 'DVI TO HDMI CABLE 2M', 'his DVI Male to HDMI Male Cable support Bi-Directional transmission. It is possible to connect source devices with HDMI port to output devices with DVI port. Or connect DVI-enabled devices to HDMI-enabled devices.', '15.90', 2, 'icon\\product\\Catogories\\Mobiles & Accessories\\HDMLcable.jpg'),
(117, 'UGREEN 69W USB C CAR CHARGER', 'his triple-ports car charge is equipped with 2 PD3.0 fast charge ports, and one USB-A with QC3.0 fast charge protocol, which can meet the demand of simultaneous fast charge of multiple devices.\r\n1 The maximum power distribution that a single port can output is as follows: USB-C2 can reach up to 65W, USB-C1 20W and USB-A 22.5W, quick charging your laptop, tablet and phone without waiting.', '31.90', 2, 'icon\\product\\Catogories\\Mobiles & Accessories\\ugreenCarCharger.jpg'),
(118, 'VTECH BUSY LEARNERS ACTIVITY CUBE, PURPLE', 'Kids learning toy has 5 sides of play that encourage discovery and exploration; 4 light-up buttons introduce animal names, animal sounds and shapes', '95.00', 4, 'icon\\product\\Catogories\\Baby & Toys\\vtechBusyLearners.jpg'),
(119, 'MONOPOLY BOARD GAME', 'FAST-DEALING PROPERTY TRADING GAME: It\'s a Family Game Night staple! Players buy, sell, dream and scheme their way to riches with the Monopoly board game', '109.00', 4, 'icon\\product\\Catogories\\Baby & Toys\\monopoly.jpg'),
(120, 'CLASSIC JENGA GAME WITH GENUINE HARWOOD BLOCKS', '54 hardwood JENGA blocks!\r\n1 Win by being the last player to remove a block without causing the stack to crash!', '25.00', 4, 'icon\\product\\Catogories\\Baby & Toys\\jengaGame.jpg'),
(121, 'HASBRO GAMING CONNECT 4', 'Get 4-in-a-row first to win \r\n1 Strategize to block your opponent from winning', '30.00', 4, 'icon\\product\\Catogories\\Baby & Toys\\hasbroGaming.jpg'),
(122, 'BUMKINS SLEEVED BABY TOODLER BIB', 'Sized to fit 6-24 Months with adjustable tie closure \r\n1 Made from Bumkins easy wipe, stain and odor resistant, waterproof fabric with a catch-all pocket', '40.00', 4, 'icon\\product\\Catogories\\Baby & Toys\\babyToodler.jpg'),
(123, 'LE COQ SPORTIF MENS SHORT SLEEVE T-SHIRT', 'Soft And Breathable.Windproof Fabric \r\n1 Moisture-absorbing, Quick-Drying, Light And Breathable, Windproof, Rain-Proof, Reduce The Sticky Feeling Of Skin Sweating, Can Be Worn In Autumn And Winter', '30.00', 5, 'icon\\product\\Catogories\\Men Clothes\\LECOQsleeve.jpg'),
(124, 'FILA MEN\'S GOLF WEAR CAP', 'Cap made of PE twill material. A fun pop design with a resort style motif studded with embroidery. ■Alpine color (manufacturer color): Beige (BE) Navy (NV) White (WT); Material: Main body/100% cotton; Embroidery yarn/100% polyester; Size: Head circumference/58cm', '99.99', 5, 'icon\\product\\Catogories\\Men Clothes\\FILAgolfCap.jpg'),
(125, 'WRANGLER AUTHENTICS MEN\'S REGULAR TAPERED CARGO', 'REGULAR FIT. Built with a regular fit through the seat and thigh, these versatile cargo pants are made to move with you and keep you comfortable throughout the day.', '120.00', 5, 'icon\\product\\Catogories\\Men Clothes\\wranglerTaperedCargo.jpg'),
(126, 'TSLA MEN\'S SLEEVELESS WORKOUT SHIRTS', 'Mix of Polyester & Spandex. Excellent elasticity with enhanced range of motion.', '49.99', 5, 'icon\\product\\Catogories\\Men Clothes\\tslaSleevelessShirt.jpg'),
(127, 'COLUMBIA MEN\'S TERMINAL TACKLE HOODIE', 'OMNI-SHADE: Be safe and protected. Omni-Shade blocks UVA and UVB rays to help prevent sunburns and long-term skin damage. The tight weave construction with UV absorbent yarns block the full spectrum of harmful UV rays.', '140.50', 5, 'icon\\product\\Catogories\\Men Clothes\\columbiaTackleHoodie.jpg'),
(128, 'SALTER STAINLESS STEEL DIGITAL KITCHEN WEIGHING SCALES', 'Perfect your favourite recipes and wow your friends and family with cooking and baking made with perfectly measured ingredients! The key to any scales is accuracy.', '110.15', 7, 'icon\\product\\Catogories\\Home & Appliances\\kitchenWeighingScales.jpg'),
(129, 'E-CLOTH STAINLESS STEEL CLEANING KIT', 'The E-Cloth Stainless Steel Cleaning Kit is the perfect cleaning combination to keep stainless steel looking as good as its name. Precision-engineered microfibers harness waters cleaning power to grab grime, fingerprints, and over 99% of bacteria — using just water — then erase streaks and smudges, restoring shine for a like-new finish', '35.00', 7, 'icon\\product\\Catogories\\Home & Appliances\\cleaningKit.jpg'),
(130, 'TEFAL HOME CHEF SMART PRO INDUCTION MULTICOOKER', 'Fast cooking: pressure cooker for up to 80% faster cooking that saves you time', '159.99', 7, 'icon\\product\\Catogories\\Home & Appliances\\multicooker.jpg'),
(131, 'KITCHMIX RETRO STAINLESS STEEL 2-SLICE TOASTER', 'Anti-overheat protection and anti-leakage protection \r\n1 Made from high quality stainless steel material', '130.50', 7, 'icon\\product\\Catogories\\Home & Appliances\\toaster.jpg'),
(132, 'PHILIPS DOMESTIC APPLIANCES AIR PURIFIER', 'Fast purification suitable for spaces of up to 78 meter square', '50.00', 7, 'icon\\product\\Catogories\\Home & Appliances\\purifier.jpg'),
(133, 'DR.SCHOLL SHOES', 'Linings and topcloth made from low-chemical faux leather', '70.80', 8, 'icon\\product\\Catogories\\Women Shoe\\schollShoe.jpg'),
(134, 'AUGUST-STEEL TOE INDUSTRIAL BOOT', 'INDUSTRIAL SHOES: Add style & comfort to work with our safe & functional steel toe boots! Inspired by active performance, it has Electrical Hazard Protection of 18000 volts, & padded collar & tongue.', '70.10', 8, 'icon\\product\\Catogories\\Women Shoe\\industrialBoot.jpg'),
(135, 'BLOCH DANCE WOMEN TAP ON LEATHER TAP SHOE', 'Toe tap is secured to a resonating board for a full sound and stability', '120.00', 8, 'icon\\product\\Catogories\\Women Shoe\\blochTapShoe.jpg'),
(136, 'CROCS WOMEN SEXI WILD FLIP CROSLITE SLIP ON SCANDAL', 'PLATFORM SHOES FOR WOMEN: Reach new heights with these platform Crocs for women. They feature the comfort and style you love about the regular Classic Clogs, plus a 2.4-inch platform sole all the way around', '170.50', 8, 'icon\\product\\Catogories\\Women Shoe\\croscWildFlip.jpg'),
(137, 'GYNTHIA WHITE GLITTER HEELS', 'Look gorgeous in our latest Cynthia Court Lower Heels. This pair of court heel features open sides and low cut shoe vamp. This 3 inch lower heel is made of ivory fabric with subtle sprinkling of ivory.', '180.00', 8, 'icon\\product\\Catogories\\Women Shoe\\CynthiaWhiteGlitterHeels.jpg'),
(138, 'YOCAHER 7.5\" SKATEBOARD', 'Deck Size: 31\" Long x 7.5\" Wide . Wheel Base: 14.5\". Construction: 7-Ply Maple. Concave: Mellow.', '100.00', 9, 'icon\\product\\Catogories\\Sport & Outdoor\\yocaherSkateboard.jpg'),
(139, 'Qiccijoo Shuttlecocks', '[12 PACK BADMINTON SHUTTLECOCKS]:Each tube can hold 12 shuttlecocks. Badminton is a consumable item and it is difficult to avoid loss or damage during practice. 12-pack to meet your needs.', '30.00', 9, 'icon\\product\\Catogories\\Sport & Outdoor\\qiccijooShuttlecocks.jpg'),
(140, 'GADIEMKENSD UPF50+ OUTDOOR HAT', 'Sunscreen: Has 50+ UPF to inhibit harmful UV rays and help protect your skin, Special material with anti-UV coating which has passed UPF 50+ test. which is real UV protective. Combined with Wide and Long Visor Design, Your Head, Face, Nose and Front Neck can be well covered. It protects you from sun burn better.', '59.99', 9, 'icon\\product\\Catogories\\Sport & Outdoor\\gadiemkensdCap.jpg'),
(141, 'STEINER MARINE BINOCULARS', 'HIGH CONTRAST OPTICS - For bright, high-contrast images with true-to-life color reproduction, 7x magnification, 50 mm objective diameter, field of view at 1000YD - 356FT.', '500.90', 9, 'icon\\product\\Catogories\\Sport & Outdoor\\binocular.jpg'),
(142, 'SANUNG 2 PACK HEAVY BASKETBALL NET', 'Bold material: It is made of high-density and thick polyester which is flexible, durable and highly elastic. It can bear the most intense one-on-one game, when the ball passes through , it will give a satisfactory melody and a better scoring experience.', '15.00', 9, 'icon\\product\\Catogories\\Sport & Outdoor\\SanungbasketballNet.jpg'),
(143, 'RUST-OLEUM AUTOMOTIVE 2 IN 1 FILLER AND SANDABLE PRIMER SPRAY PAINT', 'Painter’s Touch 2X Ultra Cover is a paint and primer in one, with Comfort Tip and Any Angle Spray', '25.00', 10, 'icon\\product\\Catogories\\Automotive\\rust-oleumSprayPaint.jpg'),
(144, 'BOSCH AUTOMOTIVE REAR WIPER BLADE', 'Exclusive fx dual rubber resists heat and ozone deterioration and proven to last up to 40% longer than other premium wiper blades', '27.99', 10, 'icon\\product\\Catogories\\Automotive\\boschWiper.jpg'),
(145, 'PILLOT AUTOMOTIVE DAY/NIGHT MIRROR', 'Provides Additional Visibility And Decreases Blind Spots', '35.50', 10, 'icon\\product\\Catogories\\Automotive\\pilotMirror.jpg'),
(146, 'DRILL BRUSH KIT FOR TIRE AND RIM CLEANING', 'This power scrubber drill brush kit contains medium stiffness nylon power brushes that will attach to your favorite cordless drill. We have other power brush drill attachments in other stiffnesss and colors that may better suit you cleaning needs', '40.99', 10, 'icon\\product\\Catogories\\Automotive\\drillBrushKitTire.jpg'),
(147, 'AUTOMOTIVE PERFORMANCE MASKING TAPE', 'HUGS AUTO CURVES AND CONTOURS: Flexible, conformable backing resists breaking for faster and more consistent masking', '29.99', 10, 'icon\\product\\Catogories\\Automotive\\maskingTape.jpg'),
(148, 'STEVE MADDEN BRITTA CHEVRON QUILT SHOULDER BAG', '11\" drop when straps are doubled Magnetic snap closure', '299.99', 11, 'icon\\product\\Catogories\\Bags\\steveMaddenShoulderBag.jpg'),
(149, 'LeSportsac Tote Bag', 'Height 11.0 x Width 15.7 x Depth 5.9 inches (28 x 4); Number of Pockets: 5 (2 exterior, 3 interior)', '200.00', 11, 'icon\\product\\Catogories\\Bags\\leSportsacToteBag.jpg'),
(150, 'COACH SHOULDER BAG C4250', 'Height 7.9 x Width 9.6 x Depth 3.9 inches (20 x 24.5 x 1); Number of Pockets: 1 (0 exterior, 1 interior)', '799.99', 11, 'icon\\product\\Catogories\\Bags\\coachShoulderBag.jpg'),
(151, 'WEAVVE HOME TOTE BAG', 'Stylish and durable tote bag; Made with the same craftsmanship as our sheets', '35.00', 11, 'icon\\product\\Catogories\\Bags\\weavveHomeToteBag.jpg'),
(152, 'MATEIN TRAVEL LAPTOP BACKPACK', 'One separate laptop compartment hold 15. 6 Inch Laptop as well as 15 Inch, 14 Inch and 13 Inch Macbook/Laptop. One spacious packing compartment roomy for daily necessities, tech electronics accessories. Front compartment with many pockets, pen pockets and key fob hook, make your items organized and easier to find', '200.00', 11, 'icon\\product\\Catogories\\Bags\\mateinTravelBackpack.jpg'),
(153, 'TIMBERLAND MENS CLASSIC 2-EYE BOAT SHOE', 'BOATING IS NOT AN ACTIVITY, it\'s an attitude. Match your style to your frame of mind on land or sea with a great new pair of boat shoes. These nautical beauties come in lots of colors, so they\'re great for a casual day out or an afternoon on the boat.', '319.99', 12, 'icon\\product\\Catogories\\Men Shoe\\timberlandBoatShoe.jpg'),
(154, 'SHOE FOR CREWS MEN HOLDEN SNEAKER', 'Slip Resistant: Superior SFC slip-resistant outsole. Water-resistant: Treated to repel liquids from the surface.', '99.99', 12, 'icon\\product\\Catogories\\Men Shoe\\menSneaker.jpg'),
(155, 'ROCKPORT MEN EUREKA WALKING SHOE', 'GENUINE LEATHER: Leather upper is easy to clean and maintain, so these walking shoes for men look and feel even better with time', '199.99', 12, 'icon\\product\\Catogories\\Men Shoe\\rockportWalkingShoe.jpg'),
(156, 'TIMBERLAND MEN CHCORUA TRAIL MID WATERPROOF BOOT', 'Premium full-grain waterproof leather and mesh uppers', '300.00', 12, 'icon\\product\\Catogories\\Men Shoe\\timberlandWaterproofBoot.jpg'),
(157, 'ATIKA MEN OUTDOOR HIKING SANDALS', 'ATIKA Outdoor Athletic Sandal Series designed for outdoor and summer season.', '79.99', 12, 'icon\\product\\Catogories\\Men Shoe\\atikaHikingSandal.jpg');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
