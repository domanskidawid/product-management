INSERT INTO public.product_category (id,category_name) VALUES
(1,'Kitchen'),
(2,'Power Tools'),
(3,'Furniture'),
(4,'Electric'),
(5,'Washroom'),
(6,'Textiles'),
(7,'Misc.');

INSERT INTO public.product (id,"name",description,category_id,creation_date,update_date,last_purchased_date) VALUES
(1,'Knife Set','A set of knives in all shapes and sizes.',1,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-24 00:01:00'),
(2,'Plate Rack','A storage solution for plates.',1,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-19 00:01:00'),
(3,'Microwave','Cook food quick with this handy microwave.',1,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-24 00:01:00'),
(4,'Juicer','When life gives you lemons, make lemonade.',1,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-09-28 00:01:00'),
(5,'Meat Hooks','A butchers meat hook.',1,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-24 00:01:00'),
(6,'Cabinet Knobs','Make sure you can open your cabinets.',1,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-19 00:01:00'),
(7,'Frying Pans','Cook up a storm with this non stick frying pan.',1,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-28 00:01:00'),
(8,'Power Drill','A drill, but with an electric motor.',2,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-28 00:01:00'),
(9,'Jack Hammer','Demolish old concrete and removing pavement, it does it all1',2,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-24 00:01:00'),
(10,'Table Saw','A saw ideal for table top use.',2,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-24 00:01:00'),
(11,'Sander','Get that smooth finish you''ve been craving.',2,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-27 00:01:00'),
(12,'Circular Saw','Its a saw, but circular.',2,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-24 00:01:00'),
(13,'Diamond Core','Cut some really big holes in some really tough materials with this solid drill bit.',2,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-27 00:01:00'),
(14,'Paddle Mixer','Mix just about anything with this paddle mixer.',2,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-09-21 10:01:00'),
(15,'Sofas','Sofas galore, they''re super soft and comfortable.',3,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-28 00:01:00'),
(16,'Coffee Tables','Keep your coffee safe and stick it on one of these tables.',3,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-28 00:01:00'),
(17,'Monoblocks','Lovely paving slabs which look great anywhere!',3,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-24 00:01:00'),
(18,'Footstool','Pop your feet up, you''ve earned it.',3,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-12 00:01:00'),
(19,'Armchair','Its a chair, but for you arms.',3,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-09-28 00:01:00'),
(20,'5 Chest Drawer','So many drawers.',3,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-27 00:01:00'),
(21,'3 Chest Drawer','Not so many drawers.',3,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-27 00:01:00'),
(22,'Copper Wiring (10m)','A big ol'' spindle of copper wiring.',4,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-28 00:01:00'),
(23,'Wire Strippers','Strip wire easily, with wire strippers.',4,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-09-21 10:01:00'),
(24,'Torch','Shine on.',4,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-09-28 00:01:00'),
(25,'Cable Knife','Cut cables, with a cable knife.',4,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-19 00:01:00'),
(26,'Insulated Screwdrivers','Toasty screwdrivers.',4,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-28 00:01:00'),
(27,'Light Bulb','What a great idea.',4,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-21 00:01:00'),
(28,'Batteries','They last a really really long time.',4,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-24 00:01:00'),
(29,'Hand Towel','Towels for your hands.',5,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-19 00:01:00'),
(30,'Face Towel','Towels for you face.',5,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-24 00:01:00'),
(31,'Toilet Seats','Seats for your toilet.',5,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-25 00:01:00'),
(32,'Shower Head','Heads for your shower.',5,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-09-28 00:01:00'),
(33,'Drain Plug','A high quality drain plug.',5,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-27 00:01:00'),
(34,'Towel Rack','Hang your towels here.',5,'2020-09-20 00:01:00','2020-09-20 00:01:00','2020-10-28 00:01:00');
