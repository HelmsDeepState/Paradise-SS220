/obj/effect/proc_holder/spell/aoe/conjure/timestop/dance
	name = "Dance Time"
	desc = "This spell makes everyone dance in it's range. Enchanted targets cannot attack, but projectiles harm as usual"
	invocation = "DAN SIN FIVA"
	action_icon_state = "no_state"
	action_background_icon_state = "dance_field"
	action_icon = 'modular_ss220/antagonists/icons/rave.dmi'
	summon_lifespan = 100
	summon_type = list(/obj/effect/timestop/dancing/wizard)

/obj/effect/timestop/dancing
	name = "Dancing field"
	desc = "Feel the heat"
	icon = 'modular_ss220/antagonists/icons/160x160.dmi'
	icon_state = "dancing_ball"
	var/sound_type = list('modular_ss220/antagonists/sound/music1.mp3',
						'modular_ss220/antagonists/sound/music2.mp3',
						'modular_ss220/antagonists/sound/music3.mp3',
						'modular_ss220/antagonists/sound/music4.mp3',
						'modular_ss220/antagonists/sound/music5.mp3',
						'modular_ss220/antagonists/sound/music6.mp3')
	var/dance_probability = 60
	var/flip_probability = 30

/obj/effect/timestop/dancing/timestop()
	playsound(get_turf(src), pick(sound_type), 100, 1, -1)
	for(var/i in 1 to duration-1)
		for(var/A in orange (freezerange, loc))
			if(isliving(A))
				var/mob/living/dancestoped_mob = A
				if(dancestoped_mob in immune)
					continue
				dancestoped_mob.notransform = TRUE
				dancestoped_mob.anchored = TRUE
				if(ishostile(dancestoped_mob))
					var/mob/living/simple_animal/hostile/H = dancestoped_mob
					H.AIStatus = AI_OFF
					H.LoseTarget()
				if(prob(dance_probability))
					dancestoped_mob.emote(pick(list("spin","dance")))
				if(prob(flip_probability))
					dancestoped_mob.emote("flip")
				stopped_atoms |= dancestoped_mob
		for(var/mob/living/M in stopped_atoms)
			if(get_dist(get_turf(M),get_turf(src)) > freezerange) //If they lagged/ran past the timestop somehow, just ignore them
				unfreeze_mob(M)
				stopped_atoms -= M
		sleep(1)
	for(var/mob/living/M in stopped_atoms)
		unfreeze_mob(M)
	qdel(src)
	return

/datum/spellbook_entry/dancestop
	name = "Dance Stop"
	spell_type = /obj/effect/proc_holder/spell/aoe/conjure/timestop/dance
	category = "Rave"

/obj/effect/timestop/dancing/wizard
	duration = 100

/obj/effect/timestop/dancing/wizard/New()
	..()
	timestop()
