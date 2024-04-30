/obj/machinery/economy/vending/autodrobe/Initialize(mapload)
	products += list(
		/obj/item/clothing/head/ratge = 1,
		/obj/item/clothing/under/dress/beatrice_dress = 1,
		/obj/item/clothing/under/dress/black_idol_dress = 1,
		/obj/item/clothing/under/dress/blue_bright_dress = 1,
		/obj/item/clothing/under/dress/black_rose_dress = 1
		)
	prices += list(
		/obj/item/clothing/head/ratge = 125,
		/obj/item/clothing/under/dress/beatrice_dress = 125,
		/obj/item/clothing/under/dress/black_idol_dress = 125,
		/obj/item/clothing/under/dress/blue_bright_dress = 125,
		/obj/item/clothing/under/dress/black_rose_dress = 125
		)
	. = ..()

/obj/machinery/economy/vending/chefdrobe/Initialize(mapload)
	products += list(
		/obj/item/clothing/under/rank/civilian/chef/red = 2,
		/obj/item/clothing/suit/chef/red = 2,
		/obj/item/clothing/head/chefhat/red = 2,
		/obj/item/storage/belt/chef/apron = 1,
		/obj/item/storage/belt/chef/apron/red = 1,
		)
	prices += list(
		/obj/item/clothing/under/rank/civilian/chef/red = 50,
		/obj/item/clothing/suit/chef/red = 50,
		/obj/item/clothing/head/chefhat/red = 50,
		/obj/item/storage/belt/chef/apron = 75,
		/obj/item/storage/belt/chef/apron/red = 75,
		)
	. = ..()
