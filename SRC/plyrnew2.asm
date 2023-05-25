
	.file	"plyr.asm"
	.title	"basketball player code"
	.width	132
	.option	b,d,l,t
	.mnolist


	.include	"mproc.equ"		;Mproc equates
	.include	"disp.equ"		;Display proc equates
	.include	"gsp.equ"		;Gsp asm equates
	.include	"sys.equ"
	.include	"audit.equ"
	.include	"world.equ"		;Court-world defs
	.include	"game.equ"
	.include	"macros.hdr"		;Macros

	.include	"imgtbl.glo"
	.include	"imgtbl7.glo"
	.include	"credturb.glo"

	.asg		0,SEQT
	.include	"plyr.equ"



	.ref	tunehalf_snd
	.ref	brush20_ascii
	.ref	swat_snd,sqk1_snd,sqk2_snd,sqk3_snd,sqk4_snd
	.ref	airball_sp,sht_stunk_sp,misd_mile_sp,way_shrt_sp,misd_evry_sp
	.ref	scuf1_snd,scuf2_snd,scuf3_snd,scuf4_snd
	.ref	sqk5_snd,sqk6_snd,pass_snd,fpass_snd
	.ref	fball_snd,overtime_sp,rainbow_sp
	.ref	whitsle_snd,baddec_sp,tuneend_snd



	.ref	print_string2b,kern_chars,mess_justify,mess_cursx,mess_cursy
	.ref	mess_cursx2
	.ref	shadow1,shadow2,shadow3,shadow4,shadow5,shadow6
	.ref	shadow7,shadow8,shadow9,shadow10,shadow11,shadow12
	.ref	shadow13,shadow14,shadow15,shadow16,shadow17,shadow18
	.ref	ballshad2,ballshad4,ballshad5,ballshad7

	.ref	brick_count
	.ref	last_power
	.ref	qtr_purchased
	.ref	call_scores
	.ref	last_name_time
	.ref	bast18_ascii
	.ref	player1_data
	.ref	player2_data
	.ref	player3_data
	.ref	player4_data
	.if DRONES_2MORE
	.ref	player5_data
	.ref	player6_data
	.endif

	.ref	plyr_onfire
	.ref	pushed_speech

	.ref	grand_champs_screen
	.ref	show_hiscore

	.ref	rebound_delay
	.ref	def_play_reward,flash_reward,sinecos_get,slamming
	.ref	start_animate,pass_off,steals_off,idiot_box

	.ref	GET_ADJ
	.ref	HANGF_R_P,HANGF_W_P

	.ref	pass_to_speech
	.ref	shoots_speech
	.ref	shot_type,shot_percentage,shot_distance

	.ref	plyr_getattributes,snd_play1ovr

	.ref	scores,prt_top_scores
	.ref	score_add,score_showtvpanel2
	.ref	score_showtvpanel,tvpanelon
	.ref	gmqrtr
	.ref	clock_active
	.ref	crplate_ptr
	.ref	shot_clock,shotimer
	.ref	arw_on1plyr
	.ref	pushing_delay
	.ref	cntrs_delay
	.ref	game_time
	.ref	sc_proc
	.ref	stick_number
	.ref	doalert_snd
	.ref	flash_bigtxt

	.ref	player_data
	.ref	inc_player_stat
	.ref	stats_page,hint_page
	.ref	stats_page2
	.ref	rank_screen
	.ref	save_player_records
	.ref	game_purchased
	.ref	team1,team2
	.ref	show_ot_msg,scr1

	.ref	winner_stays_on
	.ref	print_string_C2
	.ref	mess_objid
	.ref	setup_message

	.ref	pal_clean
	.ref	pal_getf,pal_set
	.ref	fade_down_half,fade_up_half

	.ref	SCRTST
	.ref	IRQSKYE
	.ref	PCNT
	.ref	GAMSTATE,HALT
	.ref	gndx
	.ref	AUD,AUD1,GET_AUD,STORE_AUDIT
	.ref	PSTATUS2
	.ref	RNDPER
	.ref	game_over
	.ref	TWOPLAYERS

	.ref	scalebaby_t,scalehead_t,scalebighead_t,scalehugehead_t
	.ref	scale63_t,scale66_t

	.ref	ball_convfmprel
	.ref	ballobj_p
	.ref	ballpnum,ballpnumlast,ballpnumshot,ballfree
	.ref	my_ballpnumlast
	.ref	ballrimhitcnt,ballbbhitcnt
	.ref	ballpasstime
	.ref	ballscorezhit
	.ref	ballptsforshot
	.ref	ballprcv_p
	.ref	ballgoaltcnt
	.ref	ballsclastp
	.ref	ballshotinair		;Shooter  if shot in air, else -1
	.ref	inbound
	.ref	ballflash
	.ref	t1dunkcnt
	.ref	plyr_setptsdown

	.ref	halftime_showclips


	.ref	drone_main,drone_adjskill
	.ref	w3run1
	.ref	w3stand1,w4stand1,w5stand1

	.ref	_switch_addr
	.ref	_switch2_addr

	.ref	SHOTPER
	.ref	scale_t_size
	.ref	hangfnt38_ascii
	.ref	mess_line_spacing
	.ref	aly_pass_snd
	.ref	swith_hnd_sp,spn_shtup_sp
	.ref	dronesmrt


	BSSX	reduce_3ptr,16
	BSSX	kp_scores	,32
	BSSX	kp_team1	,16
	BSSX	kp_team2	,16

	BSSX	pleasewt	,16
	BSSX	PSTATUS		,16	;Player in game bits (0-3)
					;/Must be in order!
	BSSX	P1CTRL		,16	;P1 joy/but bits (0-3=UDLR, 4-6=B1-B3)
	BSSX	P2CTRL		,16	;P2 (^ 8-14 are on for a on transition
	BSSX	P3CTRL		,16	;P3 of 0-6)
	BSSX	P4CTRL		,16	;P4
	.if DRONES_2MORE
	BSSX	P5CTRL		,16	;P5
	BSSX	P6CTRL		,16	;P6
	.endif

	BSSX	P1DATA		,PDSIZE	;Player 1 data
	BSSX	P2DATA		,PDSIZE	;P2
	BSSX	P3DATA		,PDSIZE	;P3
	BSSX	P4DATA		,PDSIZE	;P4
	.if DRONES_2MORE
	BSSX	P5DATA		,PDSIZE	;D5	;always a drone
	BSSX	P6DATA		,PDSIZE	;D6	;always a drone
	.endif

	.bss	pld		,PLDSZ*NUMPLYRS	;Plyr secondary data
	BSSX	plyrobj_t	,32*NUMPLYRS	;*player obj
	BSSX	plyrproc_t	,32*NUMPLYRS	;*player process

	BSSX	plyrcharge	,16	;!0=Dunker rammed an opponent
	BSSX	plyrpasstype	,16	;!0=Turbo pass
	BSSX	plyrairballoff	,16	;!0=No airball sound

	.bss	plyrinautorbnd	,16	;!0=A plyr is in auto rebound

	BSSX	plyrpals_t 	,256*16*NUMPLYRS ;Assembled palette for each plyr
	BSSX	assist_delay	,16
	BSSX	assist_plyr	,16
	BSSX	kp_qscrs	,(2*16)*7   ;Keep scores during game play
	BSSX	kp_qscrs2	,(2*16)*7   ;Keep scores for attract mode
	BSSX	pup_lockcombo	,16	;Flag for locking power-up combos

	BSSX	pup_bighead	,16	;Bit 0-3 on = plyr 0-3 has big head
	BSSX	pup_hugehead	,16	;Bit 0-3 on = plyr 0-3 has huge head
	BSSX	pup_showshotper	,16
	BSSX	pup_notag	,16	;Bit 0-3 on = dont show plyr 0-3 arrow
	BSSX	pup_nodrift	,16	;Bit 0-3 on = no drift for block jumps
	BSSX	pup_noassistance,16	;1=turn help off
	BSSX	pup_aba		,16	;0=regular ball, !0=ABA ball
	BSSX	pup_court	,16	;0=indoor, !0=outdoor
	BSSX	pup_showhotspots,16	;Bit 0-3 on = show plyr 0-3 hotspots

	BSSX	pup_tournament	,16	;*4

	BSSX	pup_baby	,16	;Flag for baby size mode
	BSSX	pup_nomusic	,16	;Flag for no game-time music
	BSSX	pup_goaltend	,16	;Bit 0-3 on = plyr 0-3 has powerup g.t.
	BSSX	pup_maxblock	,16	;Bit 0-3 on = plyr 0-3 has stl power
	BSSX	pup_maxsteal	,16	;Bit 0-3 on = plyr 0-3 has stl power
	BSSX	pup_maxpower	,16	;Powerup power - can't be pushed down
	BSSX	pup_maxspeed	,16	;Bit 0-3 on = plyr 0-3 max runing speed
	BSSX	pup_hypspeed	,16	;Bit 0-3 on = plyr 0-3 max runing speed
	BSSX	pup_trbstealth	,16	;Bit 0-3 on = plyr 0-3 shoes dont change color
	BSSX	pup_trbinfinite	,16	;Bit 0-3 on = plyr 0-3 always has turbo
	BSSX	pup_nopush	,16	;Bit 0-3 on = plyr 0-3 can't push
	BSSX	pup_fastpass	,16	;Bit 0-3 on = plyr 0-3 has fast passing

	BSSX	pup_strongmen	,16	;Grnd champ flag 0,1 or 2 for team 

	.bss	drone_attempt	,16	;Alley oop jump up attempts



	.asg	15,HOTSPOTX_RNG
	.asg	22,HOTSPOTZ_RNG

IBX_INB		.equ	345
IBZ_INB		.equ	CZMID+10
IBX_OOB		.equ	415
IBZ_OOB		.equ	CZMID-15
IBX_CRT		.equ	395
IBZ_CRT		.equ	CZMID-15

IBX_DEF		.equ	230
IBZ_DEF1	.equ	CZMID-50
IBZ_DEF2	.equ	CZMID+70

	.if	DEBUG
	BSSX	QUICK_TIP	,16	;Set at game start.  1=quick
	.if	HEADCK
	BSSX	debug_plyr_num,16
	.endif
	.endif

	.text

 SUBR	clear_secret_powerup_ram

	clr	a0
	move	a0,@pup_lockcombo
	move	a0,@pup_bighead
	move	a0,@pup_hugehead
	move	a0,@pup_showshotper
	move	a0,@pup_showhotspots

	move	a0,@pup_nomusic

 SUBR	clear_secret_powerup_tmode

	clr	a0
	move	a0,@pup_notag
	move	a0,@pup_nodrift
	move	a0,@pup_noassistance

	move	a0,@pup_baby
	move	a0,@pup_goaltend
	move	a0,@pup_maxblock
	move	a0,@pup_maxsteal
	move	a0,@pup_maxpower
	move	a0,@pup_maxspeed
	move	a0,@pup_hypspeed
	move	a0,@pup_trbstealth
	move	a0,@pup_trbinfinite
	move	a0,@pup_nopush
	move	a0,@pup_fastpass

	move	a0,@pup_strongmen
 	rets




 SUBR	plyr_start


	callr	joy_read2

	clr	a0
	move	a0,@plyrinautorbnd
	move	a0,@plyrcharge
	move	a0,@plyrairballoff

	clr	a3
	move	@player1_data+PR_TEAMSDEF,a0,L
	cmpi	ALL_TMS_DEFEATD,a0
	jreq	set1
	move	@player2_data+PR_TEAMSDEF,a0,L
	cmpi	ALL_TMS_DEFEATD,a0
	jrne	ck1
set1
	addk	1,a3
ck1
	move	@player3_data+PR_TEAMSDEF,a0,L
	cmpi	ALL_TMS_DEFEATD,a0
	jreq	set2
	move	@player4_data+PR_TEAMSDEF,a0,L
	cmpi	ALL_TMS_DEFEATD,a0
	jrne	easy0
set2
	addk	2,a3
easy0
	move	a3,@pup_strongmen			;Grand champion playing flag


nea





	movk	ADJHEADSZ,a0		;Get head size
	calla	GET_ADJ			;1-2
	subk	1,a0
	jrle	adjoff			;No big heads?
	move	@pup_bighead,a2
	movk	0fH,a14
	xor	a14,a2
	move	a2,@pup_bighead
adjoff

	.if  DEBUG
	move	@QUICK_TIP,a14
	jrz	refon
	clr	a0
	callr	plyr_setac
	jruc	refoff
refon
	CREATE0	plyr_referee
refoff
	.else
	CREATE0	plyr_referee
	.endif

	movi	plyrproc_t+32*NUMPLYRS,a2	;Set ptrs & cnt to make plyrs
	movi	plyrobj_t+32*(NUMPLYRS-1),a9
	movk	NUMPLYRS-1,a8			;-1 to fall thru for last one
strtp1
	CREATE0	plyr_main
	move	a0,-*a2,L		;Save *proc
	subk	32,a9
	dsj	a8,strtp1

	move	a13,-*a2,L




 SUBR	plyr_main

	move	a13,a1			;0CHlr PDATA & PSDATA areas
	addi	PDATA,a1
	movi	(PRCSIZ-PDATA)/16,a2
	clr	a0
clrpd	move	a0,*a1+
	dsj	a2,clrpd



nohdcng
	movi	-1,a1
	move	a1,*a13(plyr_newdir)
	movk	1,a0
	move	a0,*a13(plyr_shtbutn)

	movk	30,a0
	move	a0,*a13(plyr_turndelay)

	move	a8,*a13(plyr_num)
	move	a8,a11

	movk	1,a7
	xor	a8,a7
	sll	5,a7			;*32
	addi	plyrproc_t,a7
	move	*a7,a7,L
	move	a7,*a13(plyr_tmproc_p),L

	movi	P2DATA-P1DATA,a7,W
	mpyu	a8,a7
	addi	P1DATA,a7
	move	a7,*a13(plyr_PDATA_p),L

	calla	plyr_getattributes	;Set attribute_p
					;A10=*Uniform attr (ignores spechds)


	movi	pd1-pdat_t,a7,W	;set ptr to tip-off init table for
	mpyu	a8,a7			; this plyr
	addi	pdat_t,a7

mtch_2
	move	*a7+,a0			;Plyr PID
	move	a0,*a13(PROCID)
	move	*a7+,a1			;Dir
	move	a1,*a13(plyr_dir)
	move	*a7+,a0			;X offset
	move	@WORLDTLX+16,a1
	add	a1,a0

	move	@gmqrtr,a3		;if not 1st qrtr, push them all over
	jrz	not2			; to the rgt side inbound
	addi	400,a0			;!!!
not2
	sll	16,a0			;X
	clr	a1			;Y
	move	*a7+,a3			;Z
	move	*a7,a2,L		;OIMG
	movi	DMAWNZ|M_3D,a4
	movi	CLSPLYR|TYPPLYR,a5
	clr	a6
	clr	a7
	calla	BEGINOBJ2
	move	a8,*a9,L		;Save *obj

	movi	scale63_t,a0		;Temp size
	move	a0,*a8(ODATA_p),L

	SLEEPK	2			;Wait for other plyrs init


	move	a10,a6			;A10=*Uniform attr (ignores spechds)

	move	*a13(plyr_attrib_p),a7,L
	move	*a7,a0,L		;*scale_t
	move	a0,*a8(ODATA_p),L
	move	*a7(PAT_BVEL),a0	;speed
	move	a0,*a13(plyr_bvel)

	move	*a7(PAT_HOTSPOT),a0	;Hotspot
	sll	    5,a0
	addi	hotspot_xz_t,a0,L
	move	*a0+,a14
	cmpi	NUMPLYRS/2,a11			
	jrlt	hs_px
	subi	WRLDMID,a14
	neg	a14
	addi	WRLDMID,a14
hs_px
	move	a14,*a13(plyr_hotspotx)
	move	*a0,a14
	move	a14,*a13(plyr_hotspotz)
	move	@PSTATUS2,a1

	movk	1100b,a2		;Team2 wants to
	movk	0011b,a3		; chk team1
	cmpi	2,a11
	jrhs	chktm
	movk	0011b,a2		;Team1 wants to
	movk	1100b,a3		; chk team2
chktm
	clr	    a0			;Drone skill if human or human tm
	and	    a1,a2
	jrnz	setskl			; br=is human or human tm

	move	*a7(PAT_SKILL),a0	;Drone skill if drone team
	and	    a1,a3
	jrz	    setskl			; br=other team is also all drones!

	clr	    a2
	clr	    a3
	clr	    a4

	movk	2,a14
	xor	    a11,a14
	btst	a14,a1
	jrz	attri_noth1
	sll	    5,a14
	addi	player_data,a14
	move	*a14,a14,L
	move	*a14(PR_COUNT),a5	;- if no entry
	or	    a5,a2			;<No effect on N bit!
	jrn	    attri_noth1
	move	*a14(PR_NUMDEF),a5	; teams defeated (0 to 29)
	add	    a5,a3
	move	*a14(PR_WINSTREAK),a5	;Winning streak (0 to ??)
	add	    a5,a4
attri_noth1
	movk	3,a14
	xor	    a11,a14
	btst	a14,a1
	jrz	    attri_noth2
	sll	    5,a14
	addi	player_data,a14
	move	*a14,a14,L
	move	*a14(PR_COUNT),a5	;- if no entry
	or	    a5,a2			;<No effect on N bit!
	jrn	    attri_noth2
	move	*a14(PR_NUMDEF),a5	; teams defeated (0 to 29)
	add	    a5,a3
	move	*a14(PR_WINSTREAK),a5	;Winning streak (0 to ??)
	add	    a5,a4
attri_noth2
	move	a2,a2
	jrn	    attri_notboth		; br=not both human opponents
	srl	    1,a3			;Avg the defeated/streaks totals
	srl	    1,a4
attri_notboth
	srl	    1,a3			;!!! Process  teams defeated
	subk	5,a3			;!!!

	cmpi	16,a4	;10		;!!!
	jrls	anotmax			;!!!
	movk	16,a4			;!!!
anotmax
	add	a3,a0			;Factor results into drone skill
	add	a4,a0
setskl
	move	a0,*a13(plyr_d_skill)

	move	a11,a14				;player number
	sll	    5,a14
	addi	player_data,a14
	move	*a14,a14,L
	move	*a14(PR_CREATED_PLYR),a3
	jrle	t1a				;br=not a created player
	move	*a14(PR_UNIFORM_NBR),a3
	btst	6,a3
	jrnz	altc				;br=home team pal.
	jruc	keepc
t1a
	movi	team1,a14
	move	*a14+,a3		;get team 's & determine which one
	move	*a14,a4			; we are now
	btst	1,a11
	jrz	    t1b
	SWAP	a3,a4
t1b
	sll	3,a3
	sll	3,a4
	addi	teampal_t,a3
	addi	teampal_t,a4
	movb	*a3,a3
	jrn	keepc			;I always keep? yes if neg
	movb	*a4,a4
	move	a4,a14
	sll	32-4,a3
	sll	32-4,a14
	cmp	a3,a14
	jrne	keepc			;Different colors?
	move	a4,a4
	jrn	altc			;Other team always keeps?
	btst	1,a11
	jrnz	keepc			;2nd team?
altc	addk	32,a6			;use alternates
keepc


	move	a11,a2
	sll	8+4,a2
	addi	plyrpals_t,a2
	PUSH	a2

	movi	128,a0
	move	a0,*a2+			;Set  colors

	.ref	SHT11			;MK SPECIAL FLAG
	move	*a7(PAT_SHOTSKILL),a1	;Check for special pals
	cmpi	SHT11,a1
	jrne	reg1		;Stay with defined pals if !=
	move	a7,a6
reg1

	move	*a7(PAT_PALF_p),a1,L	;Copy flesh

	move	*a1+,a0
plflp	move	*a1+,*a2+
	dsjs	a0,plflp


	move	*a6(PAT_PALT_p),a1,L	;Copy trim

	move	*a1+,a0
	addk	16,a1
	subk	1,a0 
pltlp	move	*a1+,*a2+
	dsjs	a0,pltlp


	move	*a6(PAT_PALU_p),a1,L	;Copy uniform
	move	*a1+,a0
	addk	16,a1
	subk	1,a0 
plulp	move	*a1+,*a2+
	dsjs	a0,plulp


	movi	ltshoepal_t,a1		;Copy shoes
	movk	13,a0
plslp	move	*a1+,*a2+
	dsjs	a0,plslp


	move	*a6(PAT_PALSW_p),a1,L	;Copy trim

	move	*a1+,a0
	addk	16,a1
	subk	1,a0
pltlpa	move	*a1+,*a2+
	dsjs	a0,pltlpa


	move	*a6(PAT_PALVP_p),a1,L	;Copy trim

	move	*a1+,a0
	addk	16,a1
	subk	1,a0
pltlpb	move	*a1+,*a2+
	dsjs	a0,pltlpb


	PULL	a0
	calla	pal_getf
	move	a0,*a8(OPAL)


	PUSH	a8			;save plyr *obj

	clr	a0
	clr	a1
	move	*a7(PAT_HEADT_p),a2,L
	addi	5*32,a2			;POINT at 6th head (straight ahead)
	move	*a2,a2,L

	movi	CZMID,a3
	movi	DMAWNZ|M_3D|M_NOCOLL,a4
	movi	CLSDEAD,a5
	clr	a6
	clr	a7
	calla	BEGINOBJ2

	move	*a13(plyr_num),a14
	srl	1,a14
	move	*a8(OIMG),a2,L
	move	*a2(ICMAP),a0,L		;Get *palette
	.ref	check_rodman2
	calla	check_rodman2
	calla	pal_getf
	move	a0,*a8(OPAL),L		;Set palette & constant

	move	a8,*a13(plyr_headobj_p),L


	movi	scalebighead_t,a0,L	;assume big
	move	*a13(plyr_num),a1

	move	@pup_bighead,a2
	btst	a1,a2
	jrnz	chkhd

	move	a1,a3			;plyr  to chk
	movk	2,a2			;privilege bit to chk
	move	@PSTATUS2,a14
	btst	a1,a14
	jrnz	ndrnh				;br=human
	move	*a13(plyr_tmproc_p),a3,L
	move	*a3(plyr_num),a3	;plyr  to chk
	movk	4,a2			;privilege bit to chk
ndrnh
	sll	5,a3
	addi	player_data,a3,L
	move	*a3,a3,L
	move	*a3(PR_PRIVILEGES),a3
	jrle	reghd			; br=not a created player
	btst	a2,a3			;BIG HEAD privilege?
	jrnz	sethd			; br=yes
reghd
	movi	scalehead_t,a0,L	;set default *scale_t
chkhd
	move	@pup_hugehead,a2
	btst	a1,a2
	jrz	sethd
	movi	scalehugehead_t,a0,L	;really big!
sethd
	move	a0,*a8(ODATA_p),L

	move	*a13(plyr_num),a1
	sll	5,a1
	addi	player_data,a1,L
	move	*a1,a1,L
	move	*a1(PR_PRIVILEGES),a1
	jrle	nsmrt			; br=not a created player
	btst	6,a1			;smarter drone ?
	jrz	nsmrt			;br=no
	
	move	@dronesmrt,a0
	move	*a13(plyr_num),a1
	movk	1,a14
	xor	a14,a1
	movk	1,a14
	sll	a1,a14
	or	a14,a0
	move	a0,@dronesmrt
nsmrt	



	clr	a0
	clr	a1
	movi	shadow1,a2
	move	*a8(OZPOS),a3
	subi	50,a3				;stupid K!!!
	movi	DMAWNZ|M_3D|M_SHAD|M_NOCOLL,a4
	calla	BEGINOBJ2
	move	a8,*a13(plyr_shadobj_p),L
	movi	50,a0				;stupid K!!!
	move	a0,*a8(OMISC)			;save Z offset

	PULL	a8			;retrieve plyr *obj



	clr	a0
	movi	PLDSZ,a9
	mpyu	a11,a9
	addi	pld,a9			;A9=*Plyr secondary data struc
	move	a9,a1
	movi	PLDSZ/16,b0
cpldlp	move	a0,*a1+
	dsj	b0,cpldlp

	sll	4,a11			;*16
	addi	P1CTRL,a11		;A11=*PxCTRL
	move	a0,*a11


	movk	STND_SEQ,a0
	move	@gmqrtr,a14
	jrnz	goa
	movi	TIPSTND_SEQ,a0
goa


	move	*a13(plyr_num),a14	;plyrs 0 & 3 will be standing
	jrz	pn03
	subk	3,a14
	jrge	pn03
	move	@gmqrtr,a14		;so will plyrs 1 & 2 if not 1st qrtr
	jrnz	pn03
	movi	TIP_SEQ,a0		;set game start tip-off seq

pn03

	.if	DEBUG
	move	@QUICK_TIP,a14
	jrz	skipq1
	movk	STND_SEQ,a0
skipq1
	.endif

	move	*a13(plyr_dir),a7
	callr	plyr_setseq		;Rets: A10=Ani cntdn



	movi	HOOPLX,a0
	movi	HOOPRX,a1
	move	*a13(plyr_num),a14
	subk	2,a14
	jrlt	sethp
	SWAP	a0,a1
sethp	move	a0,*a13(plyr_myhoopx)
	move	a1,*a13(plyr_ohoopx)


	SLEEPK	2			;Wait for others to establish data

	.bss	plyr_main_initdone,16	;Plyr init done flag (0=not, !0=is)
	movk	1,a0
	move	a0,@plyr_main_initdone


main_lp                             ;top of main player loop
	move	@HALT,a0
	jrnz	halted


	.if	IMGVIEW
	move	*a13(plyr_num),a0
	cmpi	0,a0
	jrz	yesx
	cmpi	3,a0
	jrne	halted
yesx
	movk	1,a2			;+=Me
	jruc	nobl2
	.endif


	clr	a2			;Clr owner flag (0=neither teammate)
	move	@ballpnum,a1
	move	*a13(plyr_num),a0
	cmp	a1,a0			;Plyr have the ball?
	jreq	has_ball		;br=yes
	XORK	1,a0			;No. Does his teammate?
	cmp	a1,a0
	jrne	not_tm			;br=no, other team or free
	subk	1,a2			;-=Teammate
not_tm
	move	a2,*a13(plyr_ownball)	;Save owner flag
	jruc	hadball

has_ball
	move	*a13(plyr_seqflgs),a14
	btst	NOBALL_B,a14		;Can plyr current seq hold the ball?
	jrz	can_hold		;br=yes
no_hold
	move	a2,@ballbbhitcnt	;No. Drop the ball
	move	a2,*a13(plyr_ownball)	;Save owner flag (0=neither teammate)
	subk	1,a2
	move	a2,@ballpnum		;Set to -1 for no plyr owner
	move	a2,@ballpnumlast
	calla	ball_convfmprel		;Yank ball from plyr-relative coord
	jruc	hadball

can_hold
	move	*a13(plyr_ownball),a0	;Yes. Did plyr already have it?
	jrgt	hadball		;br=yes

	move	@ballobj_p,a1,L		;No. Plyr just got the ball
	move	*a1(OYPOS),a0
	cmpi	-28,a0                  ;!!!Ball above dribble Y vel flip pnt?
	jrlt	chk_rbnd		;br=yes, chk if rebound
	move	*a1(OYVEL),a0,L		;No. Chk Y vel to see if rebound
	abs	a0
	cmpi	0c000H,a0                ;!!!Ball rolling on the floor?
	jrge	chk_rbnd		;br=no, chk if rebound

	move	*a13(plyr_jmpcnt),a0	;Yes. Is plyr in the air?
	jrnz	no_hold		;br=yes, don't pick-up rolling ball
	movi	PICKUP_SEQ,a0		;No. Pick-up ball
	move	*a13(plyr_dir),a7
	callr	plyr_setseq
	jruc	own_ball

chk_rbnd
	move	@rebound_delay,a0	;Ball just come off the boards?
	jrz	own_ball		;br=no
	move	a2,@rebound_delay	;Yes, but was it a basket?
	move	@inbound,a0
	jrnn	own_ball		;br=yes, not a rebound

	movi	PS_OFF_REB,a0		;Assume offensive rebound
	move	*a13(plyr_num),a1
	move	@ballpnumlast,a14	;Plyr on the same team as plyr who
	srl	1,a1			; missed the basket?
	srl	1,a14
	cmp	a1,a14
	jrz	offrb			;br=yes
	movi	PS_DEF_REB,a0		;No. Defensive rebound
offrb
	move	*a13(plyr_num),a1	;Inc plyr rebound stat
	calla	inc_player_stat

own_ball
	movk	1,a2
	move	a2,*a13(plyr_ownball)	;Save owner flag (+=plyr)
	move	a2,*a13(plyr_rcvpass)
	move	*a13(plyr_num),a14
	move	a14,@my_ballpnumlast
 	PUSH	a10
	move	a13,a10
	calla	arw_on1plyr		;Guy who picks up ball gets arw
	PULL	a10

	move	*a13(plyr_num),a0
	move	@ballsclastp,a1
	srl	1,a0			;Do team s for shot clock compare
	srl	1,a1
	cmp	a0,a1			;Need to reset the shot clock?
	jreq	hadball		;br=no, same team has ball

	move	*a13(plyr_num),a14
	move	a14,@ballpnumshot
	move	a14,@ballsclastp
	calla	shot_clock		;New 24


hadball
	clr	a0			;>Setup turbo flag
	move	*a13(plyr_nojoy),a6
	jrn	newjoy			;Override plyr input?
	move	*a11,a6
newjoy	btst	BUT3_B,a6		;Turbo but
	jrz	turboff
	move	*a13(plyr_PDATA_p),a1,L
	move	*a1(ply_turbo),a1
	jrz	turboff		;No turbo left?
	movk	1,a0
turboff
	move	a0,*a13(plyr_turbon)


	move	*a13(plyr_num),a4	;0DHo 1 in 4 ticks
	move	@PCNT,a0
	move	a4,a1
	sll	32-2,a0
	sll	32-2,a1
	cmp	a0,a1
	jrne	skip

	movk	1,a14			;>Get teammates dir/dist
	xor	a4,a14
	sll	5,a14			;*32
	addi	plyrobj_t,a14
	move	*a14,a0,L
	callr	seekdirdist_obob128
	move	a0,*a13(plyr_tmdir)
	move	a1,*a13(plyr_tmdist)

	srl	1,a4			;>Get opponents dir/dist
	movk	1,a14
	xor	a14,a4
	sll	6,a4			;*64
	addi	plyrobj_t,a4
	move	*a4+,a0,L
	callr	seekdirdist_obob128
	move	a0,*a13(plyr_o1dir)
	move	a1,*a13(plyr_o1dist)

	move	*a4+,a0,L
	callr	seekdirdist_obob128
	move	a0,*a13(plyr_o2dir)
	move	a1,*a13(plyr_o2dist)

	move	@ballobj_p,a0,L
	callr	seekdirdist_obob128
	move	a0,*a13(plyr_balldir)
	move	a1,*a13(plyr_balldist)

	move	*a13(plyr_myhoopx),a6
	movi	CZMID,a7
	callr	seekdirdist_obxz128
	move	a0,*a13(plyr_hpdir)
	move	a1,*a13(plyr_hpdist)

	move	*a13(plyr_ohoopx),a6
	movi	CZMID,a7
	callr	seekdirdist_obxz128
	move	a0,*a13(plyr_ohpdir)
	move	a1,*a13(plyr_ohpdist)
skip


	clr	a14			;>Setup defensive flag
	move	@ballpnum,a0
	jrn	setdef			;No owner?
	move	*a13(plyr_ownball),a0
	jrnz	setdef			;My team has?

	move	*a13(plyr_hpdist),a0

	move	*a13(plyr_num),a1
	move	@PSTATUS2,a2
	btst	a1,a2
	jrz	drn
	cmpi	220*DIST_ADDITION,a0	;stupid K!!!
    	jruc	ndrn
drn
	cmpi	310*DIST_ADDITION,a0			;stupid K!!!
ndrn	jrge	setdef			;Too far from my hoop?

	move	*a13(plyr_hpdir),a0	;Find dir difference
	move	*a13(plyr_balldir),a1
	sub	a1,a0
	abs	a0
	cmpi	040H,a0			;stupid K!!!
	jrle	dsmla
	subi	080H,a0			;stupid K!!!
	abs	a0
dsmla	subk	24,a0			;stupid K!!!
	jrle	setdef			;Not between ball and hoop?

	move	*a13(plyr_seq),a2
	cmpi	RUNDRIBTURB_SEQ,a2
	jrhi	setdef
	move	*a13(plyr_o1dist),a1
	cmpi	7ch,a1
	jrlt	defon
	move	*a13(plyr_o2dist),a1
	cmpi	7ch,a1
	jrge	setdef
defon	movk	1,a14
setdef	move	a14,*a13(plyr_indef)


	move	*a13(plyr_autoctrl),a0
	jrnz	tcc			;Temp computer control?

	move	*a13(plyr_seqflgs),a0
	btst	NOCOLLP_B,a0
	jrnz	nocol			;No collide?
	callr	plyr_chkpcollide
nocol
	move	*a13(plyr_stagcnt),a2
	jrle	nostag
	subk	1,a2
	move	a2,*a13(plyr_stagcnt)
	subk	15,a2			;stupid K!!!
	jrle	nostag

	move	*a13(plyr_seq),a14
	subk	30-15,a2		;stupid K!!!
	jrle	chkstag		;Chk stag?

	move	*a13(plyr_seq),a14

	movi	FLYBACK_SEQ,a0
	cmp	a0,a14
	jreq	cstag


	cmpi	FLYBACKWB_SEQ,a14
	jreq	cstag
	cmpi	FLYBACKWB2_SEQ,a14
	jreq	cstag
	cmpi	FLYBACK2_SEQ,a14
	jreq	cstag

	move	*a13(plyr_ownball),a1
	jrgt	haveball

	move	*a13(plyr_attrib_p),a1,L
	move	*a1(PAT_POWER),a1
	move	@last_power,a2		;Player pushing has this power
	sub	a1,a2
	abs	a2

	cmpi	1,a2
	jrle	fall
	
	sll	4,a1
	PUSH	a14
	addi	noblflail_t,a1		;Powerful guys flail more often
	move	*a1,a0
	calla	RNDPER
	PULL	a14
	movi	FLYBACK_SEQ,a0		;If similar power, always do flyback

	jrls	fall
	jruc	flail

haveball


	movi	FLYBACK_SEQ,a0		;If similar power, always do flyback

	move	*a8(OZPOS),a1
	cmpi	CZMIN+40,a1		;stupid K!!!
	jrgt	not_rear
	move	*a8(OZVEL),a1,L
	jrn	fall			;Heading over scores table?

not_rear
	move	@pushing_delay,a1
	jrnz	keepball



	movi	500,a0			; 40% chance of keeping ball if in
	cmpi	ELBO_SEQ,a14		; ELBO; could also do ELBO2_SEQ
	jrz	fbnorm

	move	*a13(plyr_attrib_p),a14,L
	move	*a14(PAT_POWER),a0

	move	@last_power,a2		;Player pushing has this power
	sub	a0,a2
	abs	a2
	cmpi	1,a2
	jrgt	norm
	movi	200,a0
	jruc	norm2a

norm
	sll	4,a0
	addi	kpball_t,a0		;Powerful guys, keep ball more often
	move	*a0,a0
norm2a
	move	*a13(plyr_ptsdown),a1
	jrle	fbnorm			;losing? no if <=
	cmpi	15,a1			; < this many down?
	jrle	fbmok
	movk	15,a1			; no, set max
fbmok	sll	4,a1
	addi	flyb_t,a1
	move	*a1,a14
	add	a14,a0
	cmpi	1000,a0			;
	jrge	keepball
fbnorm
	calla	RNDPER
	jrls	fb

keepball

	clr	a0
	move	a0,*a13(plyr_dribmode)	;Allow dribble when he gets up


	calla	pushed_speech

	movi	FLYBACKWB_SEQ,a0	;If similar power, always do flyback

	move	*a13(plyr_seqflgs),a14
	btst	DUNK_B,a14
	jrnz	fall			;In dunk?


	move	*a13(plyr_seq),a14
	subk	SHOOT_SEQ,a14		;Am I shooting?
	jrz	_50_50

	movi	50,a0			;
	move	*a13(plyr_ptsdown),a1
	jrle	i5050

_50_50

	move	*a13(plyr_attrib_p),a14,L
	move	*a14(PAT_POWER),a0

	move	@last_power,a2		;Player pushing has this power
	sub	a0,a2
	abs	a2
	cmpi	1,a2
	jrgt	norm3
	movi	250,a0			;
	jruc	i5050

norm3
	sll	4,a0
	addi	shortfly_t,a0		;Powerful guys keep ball more often
	move	*a0,a0
i5050
	calla	RNDPER
	jrhi	nofall

	movi	FLYBACKWB_SEQ,a0	;If similar power, always do flyback
	jruc	fall
nofall



flail	move	*a8(OZVEL),a0,L
	sra	1,a0
	move	a0,*a8(OZVEL),L
	move	*a8(OXVEL),a0,L
	sra	1,a0
	move	a0,*a8(OXVEL),L

	movi	FLYBACKWB2_SEQ,a0	;If similar power, always do flyback
	jruc	fall

fb
	calla	pushed_speech
	movi	FLYBACK_SEQ,a0		;If similar power, always do flyback

	move	*a13(plyr_seqflgs),a14
	btst	DUNK_B,a14
	jrnz	fall			;In dunk?

	move	*a13(plyr_attrib_p),a14,L
	move	*a14(PAT_POWER),a0

	move	@last_power,a2		;Player pushing has this power
	sub	a0,a2
	abs	a2
	cmpi	1,a2
	jrgt	norm5

	movi	FLYBACK_SEQ,a0		;If similar power, always do flyback

	jruc	fall
norm5

	sll	4,a0
	move	*a13(plyr_ptsdown),a1
	jrle	winshortfly			;Br= I'm winning!
	addi	shortfly_t,a0
	move	*a0,a0
	jruc	flyout
winshortfly			;Br= I'm winning!
	addi	winshortfly_t,a0
	move	*a0,a0


flyout

	calla	RNDPER
	jrhi	fly_short

	movi	FLYBACK_SEQ,a0		;If similar power, always do flyback
	jruc	fall

fly_short
	move	*a8(OZVEL),a0,L
	sra	1,a0
	move	a0,*a8(OZVEL),L
	move	*a8(OXVEL),a0,L
	sra	1,a0
	move	a0,*a8(OXVEL),L

	movi	FLYBACK2_SEQ,a0		;If similar power, always do flyback

	jruc	fall

chkstag
	move	*a13(plyr_jmpcnt),a1
	jrz	stag			;On gnd?

	movi	FALL_SEQ,a0		;If similar power, always do flyback

	cmp	a14,a0
	jrne	fall
	jruc	cstag

stag	subi	STAGGER_SEQ,a14
	jreq	nostag
	subk	FALL_SEQ-STAGGER_SEQ,a14
	jreq	cstag

	movk	3,a0
	callr	rnd
	jrnz	nostag
	movi	STAGGER_SEQ,a0

fall
	move	*a13(plyr_dir),a7
	callr	plyr_setseq
cstag	clr	a2
	move	a2,*a13(plyr_stagcnt)
nostag


	move	@PSTATUS2,a0		;Plyr start bits 0-3
	move	*a13(plyr_num),a1
	btst	a1,a0
	jrnz	human1
	calla	drone_main
human1
tcc
	move	*a13(plyr_indef),a14
	jrz	nodef
	move	*a13(plyr_balldir),*a13(plyr_newdir)

nodef
	move	*a11,a6			;A6=Ctrl bits


	movb	*a13(plyr_seqflgs+NOJOY_B-7),a0
	jrn	clrsb			;Joy off?

	move	*a13(plyr_nojoy),a0
	jrz	joyon			;Joystick on?
	jrgt	clrsb

	btst	BUT1_B,a0
	jrnz	lock1
	btst	BUT2_B,a0
	jrnz	lock1
	move	a0,a6
	jruc	joyon

lock1
	.if	DEBUG
	LOCKUP
	.endif
	move	a0,a6
	jruc	joyon

clrsb
	srl	4,a6			;Clr stick bits
	sll	4,a6

joyon
	move	*a13(plyr_dir),a7	;A7=Dir

	move	*a13(plyr_newdir),a0
	jrn	stick			;No forced dir?
	sub	a7,a0
	jrnz	turn
	movi	-1,a0
	move	a0,*a13(plyr_newdir)


stick
	move	*a13(plyr_autoctrl),a1	;No chk if under auto ctrl
	jrnz	chkturn

	movk	1,a3			;Generic K
	move	*a13(plyr_rcvpass),a1
	move	*a13(plyr_seq),a2
	subi	RUN_SEQ,a2		;Set seq match (0) or nomatch (!0)
	jrz	sldin
	subi	RUNTURB_SEQ-RUN_SEQ,a2
	jrz	sldin
	subi	RUNDRIB_SEQ-RUNTURB_SEQ,a2
	jrz	sldin
	subi	RUNDRIBTURB_SEQ-RUNDRIB_SEQ,a2
sldin
	move	*a8(OZPOS),a0

	cmpi	CZMIN+8,a0		;stupid K!!! ;Is Z ok? Yes if >
	jrgt	upoka
	movk	JOYU_M,a14		;No. Clr stick UP bit
	andn	a14,a6

	move	a1,a1			;Receiving a pass? No if 0
	jrz	nowait
	move	a3,*a13(plyr_nojoy)	;Tell player recieving a leading pass
	move	a3,*a13(plyr_turndelay)	; to turn and wait for pass
nowait
	cmpi	CZMIN+6,a0		;stupid K!!!
	jrgt	upoka

	move	a2,a2			;Match 1 of the seqs? No if !0
	jrnz	upoka
	addk	1,a0			;Yes
upoka
	cmpi	CZMAX-6,a0		;stupid K!!! ;Is Z ok? Yes if <
	jrlt	dnoka
	movk	JOYD_M,a14		;No. Clr stick DN bit
	andn	a14,a6

	move	a1,a1			;Receiving a pass? No if 0
	jrz	nowait1
	move	a3,*a13(plyr_nojoy)	;Tell player recieving a leading pass
	move	a3,*a13(plyr_turndelay)	; to turn and wait for pass
nowait1

dnoka
	move	a0,*a8(OZPOS)

	move	*a8(OXPOS),a0
	move	*a8(OXANI+16),a14
	add	a14,a0

	cmpi	PLYRMINX,a0		;Is X ok? Yes if >
	jrgt	lok
	movk	JOYL_M,a14		;No. Clr stick LF bit
	andn	a14,a6

	move	a1,a1			;Receiving a pass? No if 0
	jrz	nowait2
	move	a3,*a13(plyr_nojoy)	;Tell player recieving a leading pass
	move	a3,*a13(plyr_turndelay)	; to turn and wait for pass
nowait2
	cmpi	PLYRMINX-15,a0
	jrgt	lok

	move	a2,a2			;Match 1 of the seqs? No if !0
	jrnz	lok
	addk	1,a0			;Yes
lok
	cmpi	PLYRMAXX,a0		;Is X ok? Yes if <
	jrlt	rok
	movk	JOYR_M,a14		;No. Clr stick RG bit
	andn	a14,a6

	move	a1,a1			;Receiving a pass? No if 0
	jrz	nowait3
	move	a3,*a13(plyr_nojoy)	;Tell player recieving a leading pass
	move	a3,*a13(plyr_turndelay)	; to turn and wait for pass
nowait3
	cmpi	PLYRMAXX+15,a0
	jrlt	rok

	move	a2,a2			;Match 1 of the seqs? No if !0
	jrnz	rok
	subk	1,a0			;Yes
rok
	move	*a8(OXANI+16),a14
	sub	a14,a0
	move	a0,*a8(OXPOS)


chkturn
	move	a6,a0
	sll	    32-4,a0
	jrz	    setdt			;No stick?

	srl	    32-4-3,a0		;0CHonvert to dir 0-127
	addi	dirc_t,a0
	movb	*a0,a0

	sub	    a7,a0			;A0=Difference
	jrz	    samedir

turn	
    move	a0,a1			;>Turn the shortest way
	abs	a0

	subk	8,a0			;Turn faster

	jrge	i340			;Far?
	add	    a1,a7			;Make exact
	jruc	i380

i340	
    cmpi	64-6,a0
	jrle	i350
	neg	a1
i350	
    move	a1,a1
	jrnn	i360
	subk	16,a7			;-8

i360
	addk	8,a7			;+8

i380	
    sll	    32-7,a7			;Make 0-127
	srl	    32-7,a7
	move	a7,*a13(plyr_dir)

	movk	01fH,a0
	callr	rnd
	jrnz	nosq			;No squeak?
	move	@PCNT,a0
	movk	3,a1
	and	    a1,a0
	sll	    5,a0
	move	@pup_court,a14
	addi	sqsnds,a0
	jruc	nosq1
nosq0
	addi	sqsnds2,a0
nosq1
	move	*a0,a0,L
	calla	snd_play1
nosq

	move	*a13(plyr_seqflgs),a0
	btst	WALK_B,a0
	jrnz	nodir
	move	*a13(plyr_seqdir),a0
	move	a7,a1			;Dir
	addk	8,a1
	sll	    32-7,a1
	srl	    32-7+4,a1		;Kill frac
	cmp	    a0,a1
	jreq	nodir			;Already in this dir?
	move	*a13(plyr_seq),a0
	callr	plyr_setseq
nodir	
    clr	a0
	jruc	setdt

samedir
	move	*a13(plyr_dirtime),a0
	addk	1,a0
setdt	
    move	a0,*a13(plyr_dirtime)


	move	*a8(OXVEL),a2,L
	move	*a8(OZVEL),a3,L

	move	*a13(plyr_jmpcnt),a0
	jrnz	drift			;Jumping?

	move	*a13(plyr_seqflgs),a4	;No, but still on the way down?
	btst	DRIFT_B,a4
	jrz	nodrift		;No if 0

drift	move	*a8(OXPOS),a4		;>Put drag on vel if we drift too far
	move	*a8(OXANI+16),a0
	add	a0,a4
	move	*a8(OZPOS),a5

	move	a3,a3
	jrge	zvpos
	cmpi	CZMIN+8,a5
	jrgt	chkx			;OK?
	jruc	ydrag

zvpos	cmpi	GZMAX-6,a5
	jrlt	chkx			;OK?
ydrag	move	a3,a0			;-1/4 from vel
	sra	2,a0
	sub	a0,a3
chkx
	move	a2,a2
	jrge	xvpos
	cmpi	PLYRMINX2,a4
	jrgt	setvel			;OK?
	jruc	xdrag
xvpos
	cmpi	PLYRMAXX2,a4
	jrlt	setvel			;OK?
xdrag	move	a2,a0			;-1/4 from vel
	sra	2,a0
	sub	a0,a2
	jruc	setvel


nodrift
	move	a2,a0			;>-1/4 from XZVEL
	sra	2,a0
	sub	a0,a2
	move	a3,a0
	sra	2,a0
	sub	a0,a3

	btst	NOMV_B,a4
	jrnz	setvel			;No moving?


	move	*a13(plyr_autoctrl),a1
	jrz	noautoc
	movi	01a000H,a14
	jruc	noturb1

noautoc
	move	*a13(plyr_bvel),a14
	sll	4,a14

	move	*a13(plyr_num),a0
	move	@pup_hypspeed,a1
	btst	a0,a1
	jrz	nohyper


	addi	05800H,a14
nohyper

	move	*a13(plyr_ownball),a1
	jrle	nobal			;Have ball?


	move	*a13(plyr_ohpdist),a1
	cmpi	0174H*DIST_ADDITION,a1
	jrlt	nobal
	move	@shotimer,a1,L
	jrz	nobal
	cmpi	[1,0],a1
	jrz	nobal

	move	*a13(plyr_ptsdown),a1
	jrgt	nobal			;If losing, don't slow down

	subi	04000H,a14		;Slow him down more!

nobal
	move	@game_time,a1,L
	cmpi	050000h,a1
	jrge	noxtraspd



	move	*a13(plyr_num),a1
	cmpi	2,a1
	jrge	tm2
	move	@scores,a0
	move	@scores+16,a1
	cmp	    a0,a1
	jrle	noxtraspd
	jruc	yes50

tm2	move	@scores,a0
	move	@scores+16,a1
	cmp	a0,a1
	jrge	noxtraspd
yes50
	addi	01c00H,a14
noxtraspd

	move	*a13(plyr_offscrn),a1
	jrz	onscrn
	addi	08000H,a14		;Speedup when offscrn

	move	@WORLDTLX+16,a0
	addi	200,a0
	move	*a8(OXPOS),a1
	cmp	a1,a0
	jrgt	offlft
	btst	JOYL_B,a6
	jrz	conta
	jruc	add

offlft
	btst	JOYR_B,a6
	jrz	conta
add	addi	08000H,a14		;Coming back!
conta


	clr	a1
	move	a1,*a13(plyr_offscrn)
onscrn

	move	*a13(plyr_ownball),a1
	jrz	chkturb
	subi	0e80H,a14		;Slow offense down
	move	a1,a1
	jrn	chkturb		;Buddy has ball?
	subi	01100H,a14		;Slow him down
chkturb
	move	*a13(plyr_turbon),a0
	jrz	noturb1
	addi	03f00H,a14

noturb1
	movk	11b,a0
	and	a6,a0
	jrz	nodiag			;Neither up or dn?
	movk	1100b,a0
	and	a6,a0
	jrz	nodiag			;Neither lft or rgt?
	move	a14,a0
	sra	3,a0
	sub	a0,a14			;-12%
nodiag


	move	*a8(OXPOS),a4
	move	*a8(OXANI+16),a0
	add	a0,a4
	move	*a8(OZPOS),a5
	btst	JOYU_B,a6
	jrz	noup1
	cmpi	CZMIN+8,a5
	jrle	noup1			;Min?
	sub	a14,a3
noup1
	btst	JOYD_B,a6
	jrz	nodn
	cmpi	GZMAX-6,a5
	jrge	nodn			;Max?
	add	a14,a3
nodn
	btst	JOYL_B,a6
	jrz	chkr
	sub	a14,a2
	cmpi	PLYRMINX,a4
	jrgt	setvel			;In bounds?
	move	*a13(plyr_autoctrl),a0
	jrnz	setvel
	add	a14,a2
	jruc	setvel
chkr
	btst	JOYR_B,a6
	jrz	setvel
	add	a14,a2
	cmpi	PLYRMAXX,a4
	jrlt	setvel			;In bounds?
	move	*a13(plyr_autoctrl),a0
	jrnz	setvel
	sub	a14,a2

setvel	move	a2,*a8(OXVEL),L
	move	a3,*a8(OZVEL),L
nomv



					;0DHo turbo meters
	btst	BUT3_B,a6		;Turbo but
	jrz	turdone


	btst	BUT3_B+8,a6
	jrz	noelbo

	move	*a13(plyr_tbutn),a14
	clr	a0
	move	a0,*a13(plyr_tbutn)
	subk	1,a14
	jrlt	noelbo			;Too quick?
	subk	8-1,a14
	jrgt	noelbo			;Too late?

	move	*a13(plyr_seq),a14
	cmpi	STNDWB_SEQ,a14
	jreq	elbo_ok
	cmpi	STNDWB2_SEQ,a14
	jreq	elbo_ok
	cmpi	STNDDRIB2_SEQ,a14
	jreq	elbo_ok
	cmpi	RUNDRIB_SEQ,a14
	jreq	elbo_ok
	cmpi	RUNDRIBTURB_SEQ,a14
	jreq	elbo_ok
	subk	STNDDRIB_SEQ,a14
	jrne	noelbo
elbo_ok

	move	@gmqrtr,a0
	jrnz	s1

	move	@game_time,a0,L
	cmpi	02040906H,a0
	jrge	noelbo

s1
	move	*a13(plyr_PDATA_p),a2,L	;Shrink turbo meter for this plyr
	move	*a2(ply_turbo),a1
	subk	TURBO_CNT/7*2,a1		;!!! Min cnt for elbow
	jrle	noelbo			;Turbo too low?
	move	a1,*a2(ply_turbo)
	sll	5,a1
	addi	TURBO_52,a1
	move	*a2(ply_meter_imgs+32),a0,L
	move	*a1(0),*a0(OSAG),L


notingame
	movi	60,a0
	move	a0,@steals_off		;Don't allow steals for 60 ticks

	movi	ELBO2_SEQ,a0
	move	*a13(plyr_dribmode),a14
	jrn	elbw			;br=cant dribble...do elbows
	move	*a13(PA8),a14,L


	move	*a14(OZVEL),a1
	abs	a1
	cmpi	0000100h,a1
	jrge	spin
	move	*a14(OXVEL),a14
	abs	a14
	cmpi	00002700h,a14
	jrle	elbw
spin

	.ref	last_spin
	move	@last_spin,a1
	move	@PCNT,a14
	move	a14,@last_spin
	sub	a1,a14
	abs	a14
	cmpi	2*60,a14
	jrgt	norms


	clr	a0
	move	a0,@steals_off		;Don't allow steals for 10 ticks
norms
	movi	SPIN_MOVE_SEQ,a0
elbw
	callr	plyr_setseq
	jruc	turdone

noelbo

	move	*a13(plyr_num),a0	;If on fire, don't use turbo on run
	move	@plyr_onfire,a1
	btst	a0,a1
	jrnz	turdone		;br=on-fire

	.ref	refill_turbo
	move	@pup_trbinfinite,a1
	btst	a0,a1
	jrz	doturb
	move	a11,a14
	move	*a13(plyr_PDATA_p),a11,L
	calla	refill_turbo
	move	a14,a11
	jruc	turdone
doturb
	move	*a13(plyr_PDATA_p),a0,L
	move	*a0(ply_turbo),a1	;Turbo info in PxDATA (0...TURB_CNT-1)
	jrz	turdone		;No turbo left?
	move	*a0(ply_turbo_dl),a2	;Cnt for delaying dec of ply_turbo
	subk	1,a2
	move	a2,*a0(ply_turbo_dl)
	jrnz	turdone

	subk	1,a1
	move	a1,*a0(ply_turbo)	;Turbo meter size to get smaller

	movk	390/TURBO_CNT,a2	;!!! Rate of decline
	move	a2,*a0(ply_turbo_dl)
	movk	200/TURBO_CNT,a2	;!!! Rate of replenish
	move	a2,*a0(used_turbo)
	move	*a0(ply_idiot_use),a2
	inc	a2
	move	a2,*a0(ply_idiot_use)

	sll	5,a1
	addi	TURBO_52,a1
	move	*a0(ply_meter_imgs+32),a2,L
	move	*a1(0),*a2(OSAG),L


turdone
	move	*a13(plyr_tbutn),a0	;Ticks since turbo button last hit
	addk	1,a0
	move	a0,*a13(plyr_tbutn)





	move	*a13(plyr_shtdly),a0
	jrle	nodly			;No delay?

	.if	DEBUG
	cmpi	30,a0
	jrlt okz
	
	move	@ballobj_p,a14,L

	move	*a14(OYPOS),a14
	cmpi	-40,a14
	jrle	okz			;Ball close to gnd?
	move	@inbound,a14
	jrnn	okz
	move	@ballpnum,a14		;Plyr  who owns (0-3) or Neg
	jrnn	okz
okz
	.endif

	subk	1,a0
	move	a0,*a13(plyr_shtdly)
nodly


	move	*a13(plyr_rcvpass),a0	;>Pass receiving
	jrle	norcvp			;No pass?
	subk	1,a0
	move	a0,*a13(plyr_rcvpass)
	jrgt	norcvp			;Not yet?
	move	a0,*a13(plyr_nojoy)

norcvp
	move	*a13(plyr_seq),a2
	cmpi	RUNDRIBTURB_SEQ,a2
	jrhi	anicnt

	move	a6,a1			;0CHhange ani if no joy
	sll	32-4,a1
	jrz	nojoy			;Joy neutral?

	movi	38,a14			;stupid K!!!Delay before auto zturn toward ball
	move	*a13(plyr_ownball),a0
	jrz	indef
	movi	60,a14			;stupid K!!!^
indef
	move	a14,*a13(plyr_turndelay)

	move	*a13(plyr_indef),a14
	jrz	nodef2

	move	*a13(plyr_seqflgs),a0
	btst	WALK_B,a0
	jrnz	anicnt

	srl	32-4-3,a1		;0CHonvert to dir 0-127
	addi	dirc_t,a1
	movb	*a1,a1

	sub	a7,a1
	move	a1,a14			;Calc dir dist
	abs	a14
	cmpi	040H,a14
	jrle	diffsml
	neg	a1
	subi	080H,a14
	abs	a14
diffsml
	movk	WALKFDEF_SEQ,a0
	cmpi	16,a14
	jrlt	setseq
	movk	WALKBDEF_SEQ,a0
	cmpi	030H,a14
	jrgt	setseq
	movk	WALKLDEF_SEQ,a0
	move	a1,a1
	jrn	setseq
	movk	WALKRDEF_SEQ,a0
	jruc	setseq

nodef2
	movk	RUN_SEQ,a0		;>Setup run sequence
	move	*a13(plyr_ownball),a14
	jrle	nobl
	move	*a13(plyr_dribmode),a14
	jrn	stndwb			;Can't drib?
	movk	RUNDRIB_SEQ,a0
nobl
	move	a0,a1
	move	*a13(plyr_turbon),a14
	jrz	slow
	addk	1,a0			;Turbo version
slow
	addk	1,a1
	sub	a2,a1
	subk	1,a1
	jrhi	setseq			;Different type?

	move	*a13(plyr_ani_p),a14,L
	move	*a14+,a14
	jrnz	anicnt			;!At end?
	jruc	setseq

nojoy
	move	*a13(plyr_seqflgs),a0
	btst	WALK_B,a0
	jrnz	anicnt

	movk	STNDDEF_SEQ,a0		;>Setup stand sequence
	movk	STNDDRIBDEF_SEQ,a1
	move	*a13(plyr_indef),a14
	jrnz	chkb

	movk	STND2_SEQ,a0
	movk	STNDDRIB_SEQ,a1

	move	*a13(plyr_turndelay),a14
	jrz	turnok1
	subk	1,a14
	move	a14,*a13(plyr_turndelay)
	subk	20,a14
	jrgt	chkb
turnok1
	move	*a13(plyr_o1dist),a14
	cmpi	155*DIST_REDUCTION,a14
	jrlt	stnd0
	move	*a13(plyr_o2dist),a14
	cmpi	155*DIST_REDUCTION,a14
	jrgt	stnd1
stnd0
	movk	STND_SEQ,a0
	movk	STNDDRIB2_SEQ,a1
stnd1

	move	*a13(plyr_ownball),a14
	jrle	chka
	move	*a13(plyr_turndelay),a14
	jrz	turnok0
	dec 	a14
	move	a14,*a13(plyr_turndelay)
	jruc	chkb

turnok0
	move	*a13(plyr_ohpdir),a14
	move	a14,*a13(plyr_newdir)
	jruc	chkb
chka
	move	*a13(plyr_turndelay),a14
	jrz	turnok
	dec 	a14
	move	a14,*a13(plyr_turndelay)
	jruc	chkb
turnok	move	*a13(plyr_balldir),a14
	move	a14,*a13(plyr_newdir)



chkb	move	*a13(plyr_ownball),a14
	jrle	setseq
	move	a1,a0
	move	*a13(plyr_dribmode),a14
	jrgt	setseq			;Dribbling?
stndwb	movk	STNDWB_SEQ,a0
	move	@inbound,a14
	jrnn	setseq
	move	*a13(plyr_num),a14
	btst	0,a14
	jrnz	setseq
	movk	STNDWB2_SEQ,a0

setseq	cmp	a0,a2

	.if	1		;0 for plyr anim patch temp
	jreq	anicnt

	.if	IMGVIEW
	movi	debug_SEQ1,a0
	.endif

	callr	plyr_setseq


	.else
	movk	STNDDRIB_SEQ,a0
	move	*a13(plyr_seq),a1
	cmp	a0,a1
	jrne	tmp0
	move	*a13(plyr_seqdir),a1
	cmpi	4,a1
	jreq	anicnt
tmp0	movi	040H,a7
	callr	plyr_setseq
	.endif


anicnt	dsj	a10,noani1

	move	*a13(plyr_ani_p),a14,L		;>Set new ani
getdel	
    move	*a14+,a10			;Delay
	jrnn	nocodea				;Not code?

	move	*a14+,a0,L			;*Code
	move	a14,b4
	call	a0				;Can trash scratch, A2-A5
	move	b4,a14
	jruc	getdel

nocodea	
    jrnz	i100
	move	*a13(plyr_seqcode_p),a0,L
	jrge	noendc
	call	a0				;Can trash scratch, A2-A5
noendc	move	*a13(plyr_ani1st_p),a14,L	;Head of list

getdel2
	move	*a14+,a10

	jrnn	i100
				;Not code?
	move	*a14+,a0,L			;*Code
	move	a14,b4
	call	a0				;Can trash scratch, A2-A5
	move	b4,a14
	jruc	getdel2


i100	
    move	*a14+,a0,L			;*Img
	move	*a14+,a1			;Flags (OCTRL)
	move	*a13(plyr_anirevff),a2		;Get reverse flip flag
	xor	a2,a1
	move	a1,a4

	move	*a0(IANI2Z),*a13(plyr_ballzo)

	move	a14,*a13(plyr_ani_p),L
	callr	plyr_ani

	callr	anipt2_getsclxy
	move	a0,*a13(plyr_ballxo),L
	sra	16,a1
	move	a4,a4
	jrnn	ynorma				;!YFree flag?
	movi	-200,a1
ynorma	
    move	a1,*a13(plyr_ballyo)

	move	*a13(plyr_jmpcnt),a14
	jrnz	injmp				;Jumping?

	move	*a13(plyr_aniy),a1
	neg	a1
	move	a1,*a8(OYPOS)			;Set on gnd

	cmpi	30,a10
	jrlt	injmp
	movk	4,a10
injmp

	move	*a8(OIMG),a2,L			;>Set new head img
	move	*a2(IANI3ID),a1
	sll	5,a1				;*32
	move	*a2(IANI3Z),a14
	neg	a14

	move	*a13(plyr_attrib_p),a0,L
	move	*a0(PAT_HEADT_p),a0,L
	add	a1,a0
	move	*a0,a4,L

	move	*a13(plyr_headobj_p),a3,L
	move	a14,*a3(OMISC)
	move	a4,*a3(OIMG),L			;Set new img
	move	*a4,a14,L
	move	a14,*a3(OSIZE),L
	move	*a4(ISAG),*a3(OSAG),L

	setf	1,0,0
	move	*a8(OCTRL+4),*a3(OCTRL+4)	;Copy HFlip bit
	move	*a2(IFLAGS+FLIPH_IFB),a14	;Chk reverse bit
	jrz	nohflip
	move	*a3(OCTRL+4),a14		;Reverse hflip
	addk	1,a14
	move	a14,*a3(OCTRL+4)
nohflip
	setf	16,1,0
noani1



	move	*a13(plyr_jmpcnt),a0	;>Jumping
	jrz	noj
	addk	1,a0
	move	a0,*a13(plyr_jmpcnt)

	move	*a13(plyr_hangcnt),a0
	jrle	nohang			;Not hanging?
	subk	1,a0
	move	a0,*a13(plyr_hangcnt)
	jruc	pass			;Skip grav
nohang
	move	*a8(OYVEL),a0,L

	addi	GRAV,a0			;+Gravity
	jrn	    i200
	move	*a8(OYPOS),a1
	move	*a13(plyr_aniy),a14
	add	a14,a1			;Ani pt position
	jrlt	i200			;Above gnd
	neg	a14
	move	a14,*a8(OYPOS)		;Set on gnd

	.if	DEBUG
	.endif

	movk	1,a10			;Run landing seq
	clr	a0
	move	a0,*a13(plyr_jmpcnt)
i200	move	a0,*a8(OYVEL),L

	move	*a13(plyr_seqflgs),a0
	btst	DUNK_B,a0
	jrnz	znubb			;In dunk?

	move	*a8(OZPOS),a1		;Get SZ
	subi	CZMID,a1
	abs	a1
	cmpi	40,a1
	jrge	znubb
	move	*a8(OXPOS),a0		;Get SX
	move	*a8(OXANI+16),a14
	add	a14,a0
	subi	WRLDMID,a0
	abs	a0
	move	a0,a3
	movi	020000H,a14
	cmpi	HOOPRX-WRLDMID+13,a0
	jrge	undrbb			;Under backboard?

	subk	10,a1
	jrgt	znubb
	cmpi	HOOPRX-WRLDMID-8,a3
	jrlt	znubb			;!Under rim?

	movi	010000H,a14
	move	*a8(OXVAL),a1,L
	cmpi	WRLDMID<<16,a1
	jrlt	rhoop
	neg	a14
rhoop	add	a14,a1
	move	a1,*a8(OXVAL),L

	movi	010000H,a14
undrbb
	move	*a8(OZVAL),a1,L
	cmpi	CZMID<<16,a1
	jrge	dzpos			;In front of?
	neg	a14
dzpos	add	a14,a1
	move	a1,*a8(OZVAL),L

znubb

	move	*a13(plyr_ownball),a1
	jrz	pass			;No ball?
	jrlt	sblk			;Teammate has ball?

 	move	*a13(plyr_jmpcnt),a0
 	subk	12,a0
	jrlt	pass			;Too soon?
	move	*a13(plyr_seq),a0
	cmpi	DDUNK_STRT2_SEQ,a0		;already in seq. ?
	jreq	znub3				;br=yes

	move	*a13(plyr_seqflgs),a0
	btst	DUNK_B,a0
	jrz	znub3

	btst	BUT2_B+8,a6			;pressed PASS button?
	jrnz	ddnk				;br=yes

	btst	BUT1_B+8,a6			;pressed SHOOT button?
	jrz	znub3				;br=no
ddnk




 	move	*a13(plyr_num),a0
	move	@PSTATUS2,a14
	btst	a0,a14
	jrnz	norm1
	xori	1,a0
	btst	a0,a14
	jrz	norm1
 	move	*a13(plyr_jmpcnt),a0
 	subi	40,a0
	jrlt	pass			;Too soon?
norm1


	movk	LAY_UP,a0
	move	a0,@shot_type

	move	*a13(plyr_slam_ticks),a14
	subk	10,a14				;close to rim ?
	move	*a13(plyr_jmpcnt),a0
	sub	a0,a14
	jrn	znub3				;br=too late

	move	*a13(plyr_dir),a7
	movi	DDUNK_STRT2_SEQ,a0
	callr	plyr_setseq
	jruc	pass

znub3
	move	*a8(OYPOS),a1
	move	*a13(plyr_aniy),a14
	add	a14,a1			;Ani pt position
	addk	15,a1
	jrlt	chkb1			;High enough?

	move	*a13(plyr_seqflgs),a0
	btst	DUNK_B,a0
	jrnz	slp			;Already started?


	btst	SHOOT_B,a0
	jrz	slp

	move	@gmqrtr,a0
	jrnz	shoot2
	
	move	*a13(plyr_seq),a0
	cmpi	QSHOOT_SEQ,a0
	jrz	shoot2
					;Force him to shoot 
	movk	5,a0
	move	*a13(plyr_num),a1
	calla	idiot_box		;Tell him to release ball at peak of jump

	jruc	shoot2			;Too low?

chkb1

	move	*a13(plyr_seq),a0
	subk	REBOUND_SEQ,a0
	jreq	reb
	subk	REBOUNDA_SEQ-REBOUND_SEQ,a0
	jrne	noreb
reb
	btst	BUT1_B+8,a6
	jrz	noreb			;No press?

	move	*a13(plyr_ohpdist),a14
	cmpi	150*DIST_ADDITION,a14
	jrgt	pass			;Too far?

	move	*a13(plyr_ownball),a0
	jrle	pass			;Don't have?

	move	*a13(plyr_ohpdir),a0
	move	*a13(plyr_dir),a1
	sub	a1,a0
	abs	a0
	cmpi	040H,a0
	jrle	rdsml
	subi	080H,a0
	abs	a0
rdsml	subk	32,a0
	jrgt	pass			;Not between ball and hoop?

	movk	2,a0
	move	a0,@ballptsforshot
	movk	FINGER_ROLL,a0
	move	a0,@shot_type
	movk	LAYUPREB_SEQ,a0
	callr	plyr_setseq
	jruc	pass

noreb

	btst	BUT1_B,a6
	jrnz	pass			;Holding shoot button?

	btst	BUT2_B+8,a6
	jrnz	dopass			;Air dish off pass?

	move	*a13(plyr_seqflgs),a0
	btst	DUNK_B,a0
	jrnz	slp			;Already started?

	btst	SHOOT_B,a0
	jrz	slp

shoot2




	callr	plyr_shoot
	movk	1,a10
	jruc	pass




noj	move	@ballpnum,a0
	jrge	sblk			;Somebody has ball?
	move	*a13(plyr_seq),a0
	cmpi	RUNDRIBTURB_SEQ,a0
	jrhi	sblk			;Doing something?
	move	@ballgoaltcnt,a0
	jrgt	sblk			;Going towards rim?
	move	*a13(plyr_balldist),a0
	cmpi	100*DIST_REDUCTION,a0
	jrgt	sblk			;Too far?
	move	@ballprcv_p,a1,L
	jrnz	sblk			;Pass in progress?
	move	*a13(plyr_seqflgs),a0
	btst	NOJUMP_B,a0
	jrnz	sblk			;No jumping?
	move	*a13(plyr_autoctrl),a0
	jrnz	sblk			;Temp computer control?
	callr	plyr_tryrebound
	move	*a13(plyr_seqflgs),a0
	btst	NOJUMP_B,a0
	jrnz	slp			;No jumping?



sblk
	btst	BUT1_B,a6		;>Shoot/block (But1)
	jrz	pass
	move	*a13(plyr_ownball),a1
	jrn	drnshoot		;br=teammate has ball

	movk	1,a0
	move	*a13(plyr_shtbutn),a14
	cmpi	2,a14
	jrle	scont
	cmpi	9,a14
	jrge	scont
	move	*a13(plyr_seq),a0
	cmpi	QSHOOT_SEQ,a0
	jrz	dblhit
	cmpi	TIP_SEQ,a0
	jrz	dblhit
	cmpi	TIPJ_SEQ,a0
	jrz	dblhit

	clr	a0

scont	move	a0,*a13(plyr_shtbutn)

alyoop
	move	*a13(plyr_seqflgs),a0
	btst	NOJUMP_B,a0
	jrnz	pass			;No jumping?
	btst	DUNK_B,a0
	jrnz	pass			;Already in a dunk?

	move	*a13(plyr_rcvpass),a0
	jrgt	slp			;Waiting on pass?

	move	*a13(plyr_tmproc_p),a0,L
	move	*a0(plyr_rcvpass),a0
	jrgt	slp			;Teammate waiting on pass?

	callr	plyr_startjmp
	jruc	pass

drnshoot				;>Tell drone to shoot

	btst	BUT1_B+8,a6		;>Shoot/block (But1)
	jrz	pass


	move	*a13(plyr_turbon),a14
	jrnz	alyoop			;br=turbo is on!!



	move	@PSTATUS2,a0		;Plyr start bits 0-3
	move	*a13(plyr_num),a1
	XORK	1,a1
	btst	a1,a0
	jrnz	pass			;Teammate is a human?



	move	*a13(plyr_tmproc_p),a0,L
	move	*a0(plyr_ohpdist),a14
	cmpi	174h*DIST_ADDITION,a14
	jrlt	cont_shot			;Drone is close enough?


	move	@game_time,a1,L
	srl	8,a1			;Remove tenths
	subk	9,a1
	jrlt	cont_shot		;Less than 9 secs?
	move	@shotimer+16,a1		;Tens
	jrnz	pass

cont_shot


	move	*a13(plyr_tmproc_p),a0,L
	movk	DRN_SHOOT_M,a1
	move	a1,*a0(plyr_d_cflgs)

	move	*a0(plyr_ohpdist),a14
	cmpi	350*DIST_ADDITION,a14
	jrlt	pass			;Drone is close enough?

	move	@gmqrtr,a14
	jrnz	pass

	move	*a0(plyr_jmpcnt),a14
	jrnz	pass

	move	*a13(plyr_idiotbit),a14
	btst	1,a14
	jrnz	pass
	addk	2,a14
	move	a14,*a13(plyr_idiotbit)

	movk	4,a0
	move	*a13(plyr_num),a1
	calla	idiot_box		;Tell drone to shoot ball




pass					;>Pass/steal (But2)
	move	*a13(plyr_shtbutn),a0
	jrz	dblhit
	inc	a0
	move	a0,*a13(plyr_shtbutn)
dblhit

	move	*a13(plyr_ownball),a2
	jrz	steal			;No ball?

	move	*a13(plyr_rcvpass),a0
	jrgt	slp			;Waiting on pass?

	btst	BUT2_B+8,a6
	jrz	slp
	move	*a13(plyr_seqflgs),a14
	btst	PASS_B,a14
	jrnz	slp			;Passing?

	move	@pass_off,a14
	jrnz	slp			;Lockout passing for now?

	move	a2,a2
	jrlt	passtome
dopass

	callr	plyr_startpass
	jruc	slp

passtome				;>Tell drone to pass
	btst	BUT3_B,a6
	jrnz	steal			;Turbo?

	move	*a13(plyr_tmproc_p),a0,L
	movk	DRN_PASS_M,a1
regds	move	a1,*a0(plyr_d_cflgs)
	jruc	slp




steal
	btst	BUT2_B,a6
	jrz	slp			;No button?
	move	*a13(plyr_jmpcnt),a0
	jrnz	slp
	move	*a13(plyr_seq),a0
	move	*a13(plyr_num),a14
	move	@pup_nopush,a1
	btst	a14,a1
	jrnz	nopush
	btst	BUT3_B,a6
	jrnz	push			;Turbo?

nopush
	subi	STEAL_SEQ,a0
	jreq	slp

	move	*a13(plyr_rcvpass),a0
	jrgt	slp			;Getting pass?
	move	*a13(plyr_tmproc_p),a1,L
	move	*a1(plyr_rcvpass),a0
	jrgt	slp			;Getting pass?



	movi	STEAL_SEQ,a0
	callr	plyr_setseq
	move	*a13(plyr_balldir),*a13(plyr_newdir)

	jruc	slp

push
	btst	BUT2_B+8,a6
	jrz	slp			;No button?
	move	*a13(plyr_PDATA_p),a2,L
	move	*a2(ply_turbo),a1
	subk	(TURBO_CNT*2)/13,a1	;!!! Min cnt for push
	jrle	slp			;Turbo too low?
	subi	PUSH_SEQ,a0
	jreq	slp

	move	*a13(plyr_num),a0	;If on fire, don't use turbo on push
	move	@plyr_onfire,a14
	btst	a0,a14
	jrnz	notingame2		;br=on-fire

	move	a1,*a2(ply_turbo)
	sll	5,a1
	.ref	TURBO_52
	addi	TURBO_52,a1
	move	*a2(ply_meter_imgs+32),a0,L
	move	*a1(0),*a0(OSAG),L


notingame2
	movi	PUSH_SEQ,a0
	callr	plyr_setseq

slp
	move	*a13(plyr_ownball),a1
	jrle	nob
	callr	plyr_setballxyz
nob

halted
	callr	plyr_headalign
	callr	plyr_setshadow


	SLOOP	1,main_lp  ;Assumption this need to go to main player loop.


	.def	pbit_tbit
	.def	pbit_tval

pbit_tbit
	.byte	0,1,1,1,2,0,0,0
	.byte	2,0,0,0,2,0,0,0


pbit_tval
	.byte	-1, 0, 0, 0, 1,-1,-1,-1
	.byte	 1,-1,-1,-1, 1,-1,-1,-1




pdat_t	.word	P1_PID,3<<4,120,CZMID-50
	.long	w4stand1
pd1	.word	P2_PID,2<<4,180,CZMID-5
	.long	w3stand1
	.word	P3_PID,7<<4,235,CZMID+5
	.long	w5stand1
	.word	P4_PID,7<<4,280,CZMID+45
	.long	w5stand1
	.if DRONES_2MORE
	.word	P5_PID,1<<4,120,CZMID+50		;last drone on team1
	.long	w5stand1
	.word	P6_PID,5<<4,280,CZMID-50		;last drone on team2
	.long	w5stand1
	.endif

	.def	ltshoepal_t
ltshoepal_t
	.word   07fffh,077bdh,06f7bh
	.word	06739h,05ef7h,05294h
	.word	04a52h,04210h,039ceh
	.word	0318ch,0294ah,02108h
	.word	00000h


dirc_t	.byte	0,0,4<<4,0,6<<4,7<<4,5<<4,0,2<<4,1<<4,3<<4,0,0,0,0,0



sqsnds	.long	sqk1_snd,sqk2_snd,sqk3_snd,sqk4_snd,sqk5_snd,sqk6_snd
sqsnds2
	.long	scuf1_snd,scuf2_snd,scuf3_snd,scuf4_snd,scuf2_snd,scuf3_snd

kpball_t

	.asg	80/100,reduce

	.word	100*reduce,130*reduce,160*reduce,190*reduce
	.word	200*reduce,220*reduce,280*reduce,300*reduce
	.word	450*reduce,450*reduce,450*reduce

noblflail_t
	.word	85,100,105,110,115,120,150,190,250,250,300

shortfly_t
	.word	50,100,140,160,180,200,250,300,400,550,650

winshortfly_t
	.word	50/2,100/2,100/2,120/2,150/2,150/2,200/2,300/2,450/2,550/2,550/2

flyb_t


	.asg	80/100,reduce2
	.word	25*reduce2,50*reduce2,75*reduce2,100*reduce2,125*reduce2
	.word	150*reduce2,175*reduce2,200*reduce2,225*reduce2,250*reduce2
	.word	275*reduce2,275*reduce2,275*reduce2,275*reduce2,275*reduce2
	.word	275*reduce2,275*reduce2,275*reduce2,275*reduce2,275*reduce2

RED_C	.equ	3	;0	;No red with blu/blk/prp
GRN_C	.equ	1
BLU_C	.equ	3
PUR_C	.equ	3	;4	;No blk/prp
BLK_C	.equ	3
WHT_C	.equ	6
	.asg	080H,I	;Always keeps home colors
	.def	teampal_t

teampal_t
	.byte	RED_C,GRN_C,BLU_C,RED_C,BLK_C
	.byte	BLU_C,BLK_C,BLU_C,BLU_C,RED_C
	.byte	BLK_C,RED_C,PUR_C,BLK_C,PUR_C
	.byte	BLU_C,BLU_C,BLU_C,BLK_C,RED_C
	.byte	PUR_C,BLK_C,BLK_C,BLK_C,GRN_C
	.byte	BLU_C,PUR_C,BLK_C,RED_C,BLK_C

	.def	hotspot_xz_t,hotspot_xz_tend

hotspot_xz_t
	.word	WRLDMID+017cH,CZMID-082H
	.word	WRLDMID+0148H,CZMID-082H
	.word	WRLDMID+00d8H,CZMID-080H
	.word	WRLDMID+0110H,CZMID-07cH
	.word	WRLDMID+0084H,CZMID-07aH
	.word	WRLDMID+00acH,CZMID-060H
	.word	WRLDMID+0088H,CZMID-040H
	.word	WRLDMID+00d4H,CZMID-040H
	.word	WRLDMID+007cH,CZMID-014H
	.word	WRLDMID+00a4H,CZMID+000H
	.word	WRLDMID+0082H,CZMID+026H
	.word	WRLDMID+00d4H,CZMID+048H
	.word	WRLDMID+0098H,CZMID+056H
	.word	WRLDMID+00b6H,CZMID+07cH
	.word	WRLDMID+0090H,CZMID+090H
	.word	WRLDMID+00dcH,CZMID+098H
	.word	WRLDMID+011cH,CZMID+0aeH
	.word	WRLDMID+00b0H,CZMID+0b8H
	.word	WRLDMID+0148H,CZMID+0baH
	.word	WRLDMID+00f6H,CZMID+0caH
	.word	WRLDMID+017cH,CZMID+0beH
hotspot_xz_tend

NUM_HOTSPOTS	.equ	(hotspot_xz_tend-hotspot_xz_t)/32
	.def	NUM_HOTSPOTS



 SUBR	plyr_setseq

	cmpi	TIP_SEQ,a0
	jrnz	bugok
	move	@scores,a14,L
	jrz	bugok			;Game start?
	.if	DEBUG
	LOCKUP
	.endif
	movk	STND_SEQ,a0
	
bugok
	move	a0,*a13(plyr_seq)

	sll	5,a0			;*32
	addi	pseq_t,a0
	move	*a0,a0,L
	move	*a0+,a1			;Get flags
	move	a1,*a13(plyr_seqflgs)


	btst	DRIBBLE_B,a1		;0CaHlc new dribble mode
	jrnz	d

	move	*a13(plyr_dribmode),a14
	jrz	n
	movi	-1,a1
	jruc	setd

d	move	*a13(plyr_dribmode),a14
	jrnz	n
	movk	1,a1

setd	move	a1,*a13(plyr_dribmode)
n

	move	*a0+,a1,L		;Get *code
	move	a1,*a13(plyr_seqcode_p),L
	move	a7,a1			;Dir
	addk	8,a1			;Round off
	sll	32-7,a1
	srl	32-7+4,a1		;Kill frac
	move	a1,*a13(plyr_seqdir)

	clr	a14			;Dir 5-7 have reversed FLIPH
	cmpi	5,a1
	jrlt	nohf1
	movi	M_FLIPH,a14
nohf1
	move	a14,*a13(plyr_anirevff)

	sll	32-3,a1			;Clr bits
	srl	32-3-5,a1		;*32
	add	a1,a0
	move	*a0,a0,L
	move	a0,*a13(plyr_ani1st_p),L
	move	a0,*a13(plyr_ani_p),L

	movk	1,a10

	rets








 SUBR	joy_read

	move	@GAMSTATE,a0
	subk	INGAME,a0
	jrne	joy_read_x
	move	@HALT,a0
	jrnz	joy_read_x
	move	@plyrproc_t,a0,L	;Get 1st plyr proc
	move	*a0(plyr_autoctrl),a0
	jrnz	joy_read_x			;Temp computer control?

 SUBR	joy_read2		        	;Called by reftip

	move	@PSTATUS2,a0		;Plyr start bits 0-3

	.if	TUNIT

	move	@TWOPLAYERS,a14		;!0=2 plyr kit
	jrz	    a4p

	movi	P2CTRL,a1		;A1=*PxCTRL
	move	@_switch_addr,a2,L
	move	*a2,a2

	not	    a2

	srl	    2,a0			;P2
	jrnc	no2p2
	move	*a1,a14
	xor	    a2,a14			;New with old. Changed bits are now on
	and	    a2,a14			;Keep down transitions
	sll	    8,a14
	move	a2,a3
	sll	    32-8,a3
	srl	    32-8,a3
	or	    a3,a14
	move	a14,*a1

no2p2	
    addk	16,a1			;P3
	srl	1,a0
	jrnc	joy_read_x
	zext	a2
	srl	    8,a2
	move	*a1,a14
	xor	    a2,a14			;New with old. Changed bits are now on
	and	    a2,a14			;Keep down transitions
	sll	    8,a14
	or	    a2,a14
	move	a14,*a1
	jruc	joy_read_x

a4p					        ;04H player version
	movi	P1CTRL,a1		;A1=*PxCTRL

	move	@_switch_addr,a2,L
	move	*a2,a2

	not	a2

	srl	    1,a0			;P1
	jrnc	joy_read_nop1
	move	*a1,a14
	xor	    a2,a14			;New with old. Changed bits are now on
	and	    a2,a14			;Keep down transitions
	sll	    8,a14
	move	a2,a3
	sll	    32-8,a3
	srl	    32-8,a3
	or	    a3,a14
	move	a14,*a1

joy_read_nop1	
    addk	16,a1			;P2
	srl	    1,a0
	jrnc	joy_read_nop2
	zext	a2
	srl	    8,a2
	move	*a1,a14
	xor	    a2,a14			;New with old. Changed bits are now on
	and	    a2,a14			;Keep down transitions
	sll	    8,a14
	or	    a2,a14
	move	a14,*a1

joy_read_nop2
	move	@_switch2_addr,a2,L
	move	*a2,a2

	not	a2

	addk	16,a1			;P3
	srl	    1,a0
	jrnc	joy_read_nop3
	move	*a1,a14
	xor	    a2,a14			;New with old. Changed bits are now on
	and	    a2,a14			;Keep down transitions
	sll	    8,a14
	move	a2,a3
	sll	    32-8,a3
	srl	    32-8,a3
	or	    a3,a14
	move	a14,*a1

joy_read_nop3	    
    srl	1,a0			;P4
	jrnc	joy_read_x
	addk	16,a1
	zext	a2
	srl	    8,a2
	move	*a1,a14
	xor	    a2,a14			;New with old. Changed bits are now on
	and	    a2,a14			;Keep down transitions
	sll	    8,a14
	or	    a2,a14
	move	a14,*a1

	.else				;>YUNIT

	move	@SWITCH,a2,L
	not	a2

	srl	1,a0			;P1
	jrnc	joy_read_nop1a
	move	*a1,a14
	xor	a2,a14			;New with old. Changed bits are now on
	and	a2,a14			;Keep down transitions
	sll	8,a14
	move	a2,a3
	sll	32-8,a3
	srl	32-8,a3
	or	a3,a14
	move	a14,*a1

joy_read_nop1a	
    addk	16,a1			;P2
	srl	8,a2
	srl	1,a0
	jrnc	joy_read_nop_2a
	move	*a1,a14
	xor	a2,a14			;New with old. Changed bits are now on
	and	a2,a14			;Keep down transitions
	sll	8,a14
	move	a2,a3
	sll	32-8,a3
	srl	32-8,a3
	or	a3,a14
	move	a14,*a1

joy_read_nop2a	
    addk	16,a1			;P3
	srl	1,a0
	jrnc	joy_read_nop3a
	srl	16,a2
	move	a2,a14			;>Move bit 7 to 6 (But 3)
	sll	32-6,a2
	srl	7,a14
	or	a14,a2
	rl	6,a2
	move	*a1,a14
	xor	a2,a14			;New with old. Changed bits are now on
	and	a2,a14			;Keep down transitions
	sll	8,a14
	or	a2,a14
	move	a14,*a1

joy_read_nop3a	
    srl	1,a0			;P4
	jrnc	joy_read_x
	move	@SWITCH+020H,a2
	not	a2
	addk	16,a1
	sll	32-8,a2
	srl	32-8,a2
	move	*a1,a14
	xor	a2,a14			;New with old. Changed bits are now on
	and	a2,a14			;Keep down transitions
	sll	8,a14
	or	a2,a14
	move	a14,*a1


	.endif

joy_read_x ; first
	rets



	.asg	1,BABY_DETECT

 SUBRP	plyr_chkpcollide

	PUSH	a2,a3,a4,a5,a6,a7,a9,a10,a11

	move	*a8(OXPOS),a4
	move	*a8(OXANI+16),a5
	add	a5,a4			;Img center X
	move	a4,a5			;Copy for X box rgt
	move	*a8(OZPOS),a6		;A6=my Z

	move	*a8(OSIZEX),a2		;Get SIZEX & bump up if small img
	move	*a8(OIMG),a0,L
	move	*a0(IFLAGS),a14		;Large img? Yes if !-
	jrnn	pcc_1
	move	a2,a14			;Small img
	srl	2,a14
	add	a14,a2			;=125%
pcc_1
	movk	13*2,a11		;stupid K!!!A11=Z radius (for both)
	.if BABY_DETECT
	move	@pup_baby,a14		;Plyr babies? No if 0
	jrz	pcc_3
	srl	1,a2			;Yes. Half of X & Z ranges
	srl	1,a11
pcc_3
	.endif
	srl	1+1,a2			;Half for lft/rgt, more to tighten up
	sub	a2,a4			;A4=my box lft X
	add	a2,a5			;A5=my box rgt X

	movi	plyrobj_t,a7		;Set ptr to other team
	move	*a13(plyr_num),a0
	subk	2,a0
	jrge	pcc_4
	addi	64,a7
pcc_4
	movk	2,b1			;Lp cnt


test_lp	; Top of test loop
    move	*a7+,a9,L

	move	*a9(OZPOS),a2		;Chk Z
	sub	    a6,a2
	abs	    a2			;A2=ABS(dZ)
	move	a11,a3			;!!!Replaces previous comments
	cmp	    a3,a2			;Z in range? No if >=
	jrge	next

	move	*a9(OXPOS),a1		;Chk X
	move	*a9(OXANI+16),a2
	add	    a2,a1			;Img center X
	move	*a9(OSIZEX),a2		;Get SIZEX & bump up if small img
	move	*a9(OIMG),a0,L
	move	*a0(IFLAGS),a14		;Large img? Yes if !-
	jrnn	pcc_l3
	move	a2,a14			;Small img
	srl	    2,a14
	add	    a14,a2			;=125%
pcc_l3
	.if BABY_DETECT
	move	@pup_baby,a14		;Plyr babies? No if 0
	jrz	    pcc_l4
	srl	    1,a2			;Yes. Half of X range
pcc_l4
	.endif
	srl	    1+1,a2			;Half for lft/rgt, more to tighten up
	add	    a2,a1			;A1=his box rgt
	sub	    a4,a1			;His rgt > my lft? No if <=
	jrle	next
	move	a1,a10			;A10=his rgt,my lft dX
	add	    a4,a1
	sub	    a2,a1
	sub	    a2,a1			;A1=his box lft
	sub	    a5,a1			;His lft < my rgt? No if >=
	jrge	next

	abs	    a1			;Make A10=ABS(nearer dX)
	cmp	    a1,a10
	jrle	pcc_l5
	move	a1,a10
pcc_l5
	move	*a8(OYPOS),a0		;Chk Y
	move	*a9(OYPOS),a1
	addi	75,a1			;stupid K!!! Y difference
	cmp	    a1,a0
	jrgt	next			;Opponent much higher?


	move	*a8(OXVEL),a14,L	;>Outer box collision
	abs	    a14
	srl	    15,a14
	jrnz	otrbnc			;Moving in X? Yes if !0
	move	*a8(OZVEL),a2,L
	abs	    a2
	srl	    15,a2
	jrz	    chkib			;Not moving in Z? Yes if 0
otrbnc
	PUSH	a6,a7
	clr	    a0
	clr	    a1
	move	*a8(OXVEL),a6,L
	move	*a8(OZVEL),a7,L
	callr	seekdir_xyxy128		;Customize?
	PULL	a6,a7

	move	*a13(plyr_num),a2
	sll	    2,a2			;*4
	move	*a9(OPLINK),a1,L
	move	*a1(plyr_num),a1
	add	    a1,a2
	sll	    4,a2			;*16
	addi	c_t,a2
	move	*a2,a2			;Get my dir variable offset
	add	    a13,a2
	move	*a2,a2			;Get dir

	sub	    a0,a2
	move	a2,a14
	abs	    a14
	cmpi	040H,a14
	jrle	dsmlb
	neg	    a2
dsmlb	
    move	a2,a2
	jrge	angpos			;Positive angle?
	addi	028H+028H,a0
angpos	
    subi	028H,a0

	addk	4,a0
	sll	    32-7,a0
	srl	    32-7+3,a0		;Leave 4 bits
	sll	    4,a0
	addi	vel_t,a0

	move	*a0,a1
	move	*a0(16*4),a0
	sll	    1,a0
	sll	    1,a1
	move	*a8(OXVAL),a14,L
	add	    a0,a14
	move	a14,*a8(OXVAL),L
	move	*a8(OZVAL),a14,L
	add	    a1,a14
	move	a14,*a8(OZVAL),L

chkib
	movk	6,a2			;stupid K!!!Inner box delta
	.if     BABY_DETECT
	move	@pup_baby,a14		;Plyr babies? No if 0
	jrz	    pcc_ib1
	srl	    1,a2			;Yes. Half of delta
pcc_ib1
	.endif
	sub	    a2,a10			;X touch only slight?
	jrle	next

	move	*a9(OZPOS),a1
	sub	    a6,a1
	abs	    a1			;Z distance
	sub	    a2,a3
	cmp	    a3,a1			;Z touch only slight? Yes if >=
	jrge	next

	move	*a8(OXVEL),a14,L	;>Inner box collision
	move	*a9(OXVEL),a2,L
	move	a2,a3
	xor	    a14,a2
	move	a2,a2
	jrn	    xvdif			;XV different dir?
	move	a14,a0
	abs	    a3
	abs	    a0
	cmp	    a3,a0
	jrlt	skipxv			;My vel smaller?
	xor	    a14,a2			;Fix A2
	sub	    a2,a14
xvdif
	move	*a8(OXVAL),a1,L
	sub	    a14,a1
	move	a1,*a8(OXVAL),L
skipxv
	move	*a8(OZVEL),a14,L
	move	*a9(OZVEL),a2,L
	move	a2,a3
	xor	    a14,a2
	move	a2,a2
	jrn	    zvdif			;ZV different dir?
	move	a14,a0
	abs	    a3
	abs	    a0
	cmp	    a3,a0
	jrlt	next			;My vel smaller?
	xor	    a14,a2			;Fix A2
	sub	    a2,a14
zvdif
	move	*a8(OZVAL),a1,L
	sub	    a14,a1
	move	a1,*a8(OZVAL),L


	move	*a13(plyr_ownball),a0
	jrgt	next			;I have ball?

	move	*a13(plyr_stagcnt),a10	;0AddH some stagger
	move	*a9(OPLINK),a14,L

	move	*a14(plyr_seqflgs),a0
	btst	DUNK_B,a0
	jrz	    nodunk			;!Dunking?

	move	*a14(plyr_num),a2
	move	@ballpnum,a3
	cmp	    a2,a3
	jrnz	nodunk

	btst	LAYUP_B,a0
	jrnz	nodunk			;Layup=don't disrupt ball

	addk	1,a10
	move	*a13(plyr_num),a0
	move	*a14(plyr_num),a2
	srl	    1,a0
	srl	    1,a2
	cmp	    a0,a2
	jreq	nodunk			;Same team?

	move	*a13(plyr_jmpcnt),a0
	jrz	    nopop
	move	*a8(OYPOS),a0
	move	*a9(OYPOS),a1
	addk	9,a1			;15

	cmp	a1,a0
	jrgt	nopop			;Dunker is higher?


	move	@slamming,a0		;Ball already successfully into hoop
	jrnz	nopop

	move	@HCOUNT,a0
	sll	32-4,a0
	jrnz	noflsh

	calla	flash_reward

noflsh

	move	*a13(plyr_attrib_p),a14,L
	move	*a14(PAT_DEFSKILL),a0
	sll	    4,a0
	addi	tryblk_t,a0
	move	*a0,a0



	move	*a13(plyr_num),a14


	move	@PSTATUS2,a3
	btst	a14,a3
	jrnz	contb
	movk	18,a0			;Drone is less
contb

	calla	RNDPER
	jrls	nopop



	move	a13,a3
	calla	def_play_reward		;Good defensive play reward snds, etc


	move	*a13(plyr_seq),a0
	cmpi	BLOCKREJ_SEQ,a0
	jreq	disrupt
	cmpi	FASTBLOCKREJ_SEQ,a0
	jreq	disrupt

	movi	200,a0
	calla	RNDPER
	jrhi	disrupt

	move	*a8(OYVEL),a0,L
	jrn	gvbl

disrupt


	
	.ref	deflected_speech
	calla	deflected_speech

	move	*a13(plyr_dir),a0
	calla	sinecos_get

	move	@ballobj_p,a2,L

	sll	    4,a0
	sll	    4,a1
	move	a0,*a2(OZVEL),L
	move	a1,*a2(OXVEL),L
	movi	-GRAV*21,a1		;Towards roof
	move	a1,*a2(OYVEL),L

	movi	-1,a0
	move	a0,@ballpnum
	move	a0,@ballpnumlast

	calla	ball_convfmprel

	move	*a9(OPLINK),a14,L

	clr	    a0
	move	a0,*a14(plyr_ownball)
	move	a0,@ballbbhitcnt

	movk	15,a0
	move	a0,*a13(plyr_shtdly)
	move	a0,*a14(plyr_shtdly)

    jruc	nopop

gvbl
	.ref	in_air_steal_speech
	calla	in_air_steal_speech

	move	*a13(plyr_num),a0	;Give defender the ball
	move	a0,@ballpnum
	clr	a0
	move	a0,*a13(plyr_dribmode)
	move	a0,@ballbbhitcnt


nopop

nodunk	move	*a14(plyr_jmpcnt),a3
	jrz	    ongnd
	addk	1,a10			;Collided with a jumper
ongnd
	move	*a13(plyr_seqflgs),a2
	btst	EASYSTAG_B,a2
	jrz	    nesy			;!An easy stagger?
	move	*a13(plyr_num),a0
	move	*a14(plyr_num),a2
	srl	    1,a0
	srl	    1,a2
	cmp	    a0,a2
	jreq	setstg			;Same team?
	addk	1,a10
nesy
setstg	move	a10,*a13(plyr_stagcnt)

next	dsj	b1,test_lp


testlp_x	
    PULL	a2,a3,a4,a5,a6,a7,a9,a10,a11
	rets

tryblk_t
	.word	1,2,3,10,15,18,22,23,24,25,25

c_t	.word	0,plyr_tmdir,plyr_o1dir,plyr_o2dir
	.word	plyr_tmdir,0,plyr_o1dir,plyr_o2dir
	.word	plyr_o1dir,plyr_o2dir,0,plyr_tmdir
	.word	plyr_o1dir,plyr_o2dir,plyr_tmdir,0

vel_t
	.word	-16384,-15137,-11585,-6270
	.word	0,6270,11585,15137,16384,15137,11585,6270
	.word	0,-6269,-11585,-15137,-16384,-15137,-11585,-6270




 SUBRP	plyr_ani

	cmpi	ROM,a0
	jrlo	anierr

	move	a0,a2
	move	a1,a3
	callr	anipt_getsclxy		;get old XY ani's

	move	a2,*a8(OIMG),L
	movb	a3,*a8(OCTRL)
	move	*a2(ISIZE),*a8(OSIZE),L
	move	*a2(ISAG),*a8(OSAG),L

	move	*a13(plyr_attrib_p),a3,L
	move	*a3,a3,L		;Get *scale_t
	move	@pup_baby,a14		;Plyr babies? No if 0
	jrz	pa_1
	movi	scalebaby_t,a3		;Yes. Set baby *scale_t
pa_1
	move	*a2(IFLAGS),a14		;Large img? Yes if !-
	jrnn	contc
	addi	scale_t_size,a3		;No. Set small img *scale_t
contc
	move	a3,*a8(ODATA_p),L	;Save *scale_t

	move	a0,a2			;save old XY ani's
	move	a1,a3
	callr	anipt_getsclxy		;get new XY ani's

	sub	a0,a2			;subtract new from old
	sub	a1,a3

	move	a0,*a8(OXANI),L		;save new X ani
	sra	16,a1			;Y ani int only
	move	a1,*a13(plyr_aniy)	;save new Y ani

	move	a8,a0			;set XVAL base addr
	addi	OXVAL,a0
	move	*a0,a14,L		;mod XVAL with diff of old X ani to
	add	a2,a14			; new X ani
	move	a14,*a0+,L
	move	*a0,a14,L		;mod YVAL with diff of old Y ani to
	add	a3,a14			; new Y ani
	move	a14,*a0,L

anilp_x	rets

anierr 
	.if	DEBUG
	LOCKUP
	eint
	.else
	CALLERR	2,2
	.endif
	jruc	anilp_x




 SUBRP	plyr_startjmp

	PUSH	a6,a7,a9

	clr	a14
	move	a14,*a13(plyr_hotspotf)	;Clr hotspot jump flag
	move	a14,*a13(plyr_hotspotp)	;Clr hotspot shot %

	move	*a13(plyr_ownball),a5
	jrz	blk			;We don't have ball?

	move	*a13(plyr_ohoopx),a6
	movi	CZMID,a7
	callr	seekdirdist_obxz128

	move	*a13(plyr_newdir),a9	;Get old
	move	a0,*a13(plyr_newdir)	;Turn toward basket

	move	a5,a5
	jrn	tag1			;trick shot shit

	move	*a8(OXPOS),a0		;Chk hotspot X
	move	*a8(OXANI+16),a14
	add	a14,a0
	move	*a13(plyr_hotspotx),a14
	sub	a14,a0
	abs	a0
	subk	HOTSPOTX_RNG,a0
	jrnn	hsnoshow

	move	*a8(OZPOS),a0		;Chk hotspot Z
	move	*a13(plyr_hotspotz),a14
	sub	a14,a0
	abs	a0
	subk	HOTSPOTZ_RNG,a0
	jrnn	hsnoshow

	movk	1,a14
	move	a14,*a13(plyr_hotspotf)		;Set hotspot jump flag

hsnoshow
	clr	a14
	move	a14,@reduce_3ptr

	cmpi	1b0h,a1			;400+15%;!!!Desperation shot?
	jrge	desp			; br=yes

	cmpi	136h,a1			;270+15%;!!!Long 3ptr?
	jrge	i3ptr			; br=yes

	cmpi	0c0h,a1			;200+15%;!!!Hook allowed?
	jrge	tag1

	move	*a8(OZPOS),a0
	movi	CZMID,a14
	sub	a0,a14
	cmpi	110,a14
	jrgt	tag1			;Near 3 pt range?
	cmpi	70,a14
	jrgt	yes0


	subi	CZMID,a0
	cmpi	70,a0
	jrlt	tryhk2
	cmpi	98h,a0
	jrgt	tag1			;Near 3 pt range?

yes0
	move	*a13(plyr_seqdir),a14
	cmpi	2,a14
	jrz	tryhk1
	cmpi	6,a14
	jrnz	tryhk2	

tryhk1
	movi	WRLDMID,a0

	move	*a13(plyr_num),a14
	srl	1,a14
	jrnz	reg2			;Team1?

	move	*a8(OXPOS),a14
	sub	a0,a14
	cmpi	110h,a14		;160
	jrlt	tryhk2
	jruc	yes
reg2
	move	*a8(OXPOS),a14
	sub	a14,a0
	cmpi	140h,a0		;160
	jrlt	tryhk2
yes
	move	*a13(plyr_dirtime),a14
	subk	5,a14
	jrlt	tryhk2

	move	a9,*a13(plyr_newdir)	;Turn toward basket

	jruc	hs			;Hook shot


tryhk2

	move	*a8(OZPOS),a0
	cmpi	CZMID,a0
	jrgt	tryhk3


	move	*a13(plyr_seqdir),a14
	cmpi	1,a14
	jrz	tryhk2a
	cmpi	7,a14
	jrnz	tryhk3

	move	*a13(plyr_num),a14
	srl	1,a14
	jrnz	tryhk2a		;Team1?
	movk	10h,a9			;Fix wrong way hookshot!

tryhk2a
	move	*a13(plyr_ohpdist),a14
	cmpi	60h,a14			;out farther...fade away
	jrhs	tryhk3
	movi	WRLDMID,a0

	move	*a13(plyr_num),a14
	srl	1,a14
	jrnz	rega			;Team1?

	move	*a8(OXPOS),a14
	sub	a0,a14
	cmpi	140h,a14		;160
	jrgt	tryhk3
	jruc	yesa
rega
	move	*a8(OXPOS),a14
	sub	a14,a0
	cmpi	140h,a0		;160
	jrgt	tryhk3
yesa
	move	*a13(plyr_dirtime),a14
	subk	5,a14
	jrlt	tryhk3

	move	a9,*a13(plyr_newdir)	;Turn toward basket

	jruc	hs			;Hook shot


tryhk3

	move	*a13(plyr_seqdir),a14
	jrz	ahook
	subk	4,a14
	jrne	tag1
ahook
	move	*a13(plyr_ohpdir),a14
	addk	8,a14			;Round off
	sll	32-7,a14
	srl	32-7+4,a14		;Kill frac
	jrz	tag1
	cmpi	4,a14
	jrz	tag1



	move	*a13(plyr_num),a2
	srl	1,a2
	jrz	tg1			;Team1?
	cmpi	5,a14
	jrlt	tag1			;Team 2 behind hoop
	jruc	tgx
tg1	cmpi	4,a14
	jrge	tag1
tgx



	move	*a13(plyr_ohpdist),a14
	cmpi	40h,a14			;48h
	jrlt	tag1			;Too close for hook?
	move	*a8(OZPOS),a14
	cmpi	0448H,a14
	jrlt	tag1
	cmpi	04a8H,a14
	jrgt	tag1

	move	a9,*a13(plyr_newdir)	;Turn toward basket
	jruc	hs			;Hook shot

tag1

	move	*a13(plyr_newdir),a0
	move	a0,a3
	move	a1,a4			;A1=Distance to hoop for shot
					;>Skip dunks from behind the hoop
	addk	8,a0			;Round off
	sll	32-7,a0
	srl	32-3,a0			;Kill frac
	move	*a13(plyr_num),a14
	srl	1,a14
	jrnz	lhoopa			;Team2?
	subk	5,a0
	jrlt	trydunk
tag1a
	move	*a13(plyr_ownball),a5
	jrp	sj			;br=teammate doesn't have ball
tag1b	move	a9,*a13(plyr_newdir)	;Turn toward basket
	jruc	plyr_startjmp_x



lhoopa
   	move	a0,a0
	jrz	trydunk
	subk	4,a0
	jrlt	tag1a			;br=no dunk 


trydunk				;>Try a dunk
	move	*a13(plyr_ownball),a5
	jrnn	td2			;br=teammate doesn't have ball
	cmpi	65,a4			;too close for alleyoop ?
	jrle	tag1b			;br=yes...do nothing
	jruc	td2a	

td2
	cmpi	42,a4			;ADJ'd for new COURT SIZE
	jrle	velok			;Close to hoop, Allow dunk!! w/o turbo

td2a
	move	*a13(plyr_dir),a14
	sub	a3,a14
	abs	a14
	cmpi	040H,a14
	jrle	nodov
	subi	080H,a14
	abs	a14
nodov
	subk	24,a14
	jrgt	sj			;!Facing basket?

	move	*a13(plyr_PDATA_p),a14,L
	move	*a14(ply_turbo),a14
	subk	3,a14			;!!! Min cnt for dunk
	jrle	sj			;Turbo too low?


	cmpi	165,a4			;Max dunk range (ADJ'd for new COURT)
	jrge	sj			;Too far for dunk?
	move	*a8(OZPOS),a14		;Chk Z range
	cmpi	CZMAX-34,a14
	jrhs	sj
	cmpi	CZMIN+34,a14
	jrls	sj
	move	*a8(OXVEL),a14,L	;0CHhk velocity
	abs	a14
	srl	16,a14
	jrnz	velok
	move	*a8(OZVEL),a14,L
	abs	a14
	srl	16,a14
	jrz	sj
velok
	move	*a13(plyr_ownball),a5
	jrn	aly1			;alleyoop

	move	*a13(plyr_attrib_p),a0,L
	move	*a0(PAT_POWER),a0
	sll	4,a0
	addi	dnkthru_t,a0
	move	*a0,a0
	calla	RNDPER
	jrhi	dunk			;Yes, jump over anybody!


aly1
	movi	64,a7
	move	*a13(plyr_num),a14
	cmpi	2,a14
	jrlt	tm1zz
	clr	a7
tm1zz
	movi	plyrproc_t,a14,L
	add	a7,a14
	move	*a14,a14,L




	move	*a14(plyr_num),a7
	move	@plyr_onfire,a0
	btst	a7,a0
	jrz	nof1			;br=not on-fire
	movk	11,a0
	jruc	gdd
nof1
	move	*a14(plyr_attrib_p),a14,L
	move	*a14(PAT_DEFSKILL),a0
gdd
	sll	4,a0
	movi	dist_t,a14
	add	a0,a14
	move	*a14,a2			;Distance check
	movi	width_t,a14
	add	a0,a14
	move	*a14,a0			;Get width of check			;Distance check

	move	*a13(plyr_ownball),a14
	jrnn	norma				;br=not an alleyoop
	move	*a13(plyr_num),a7
	move	@PSTATUS2,a14
	btst	a7,a14				;drone ?
	jrnz	nrm				;br=no
	move	*a13(plyr_dirtime),a14
	subk	5,a14
	jrle	o1dok
	addk	15,a2				;drone has to be more open
nrm
	move	a2,a14
	srl	    1,a14
	add	    a14,a2
norma
	move	*a13(plyr_o1dist),a14
	cmp	    a14,a4
	jrlt	o1dok			;I'm closer?

	cmp	a2,a14

	jrgt	o1dok			;He's too far?
	move	*a13(plyr_o1dir),a2
	sub	a3,a2
	abs	a2
	cmpi	040H,a2
	jrle	o1dsml
	subi	080H,a2
	abs	a2
o1dsml

	sub	a0,a2

	jrlt	trylyup		;In front of me?
o1dok

	movi	64,a7
	move	*a13(plyr_num),a14
	cmpi	2,a14
	jrlt	tm1ax
	clr	a7
tm1ax
	movi	plyrproc_t+32,a14,L
	add	a7,a14
	move	*a14,a14,L

	move	*a14(plyr_num),a7
	move	@plyr_onfire,a0
	btst	a7,a0
	jrz	nof2			;br=not on-fire
	movk	11,a0
	jruc	gdd2
nof2

	move	*a14(plyr_attrib_p),a14,L
	move	*a14(PAT_DEFSKILL),a0
gdd2
	sll	4,a0
	movi	dist_t,a14
	add	a0,a14
	move	*a14,a2			;Distance check
	movi	width_t,a14
	add	a0,a14
	move	*a14,a0			;Get width of check			;Distance check

	move	*a13(plyr_ownball),a14
	jrnn	norm2				;br=not an alleyoop
	move	*a13(plyr_num),a7
	move	@PSTATUS2,a14
	btst	a7,a14				;drone ?
	jrnz	nrm2				;br=no
	move	*a13(plyr_dirtime),a14
	subk	5,a14
	jrle	trylyup
	addk	15,a2				;drone has to be more open
nrm2	
	move	a2,a14
	srl	1,a14
	add	a14,a2

norm2

	move	*a13(plyr_o2dist),a14
	cmp	a14,a4
	jrlt	o2dok			;I'm closer?
	cmp	a2,a14
	jrgt	o2dok			;He's too far?
	move	*a13(plyr_o2dir),a2
	sub	a3,a2
	abs	a2
	cmpi	040H,a2
	jrle	o2dsml
	subi	080H,a2
	abs	a2
o2dsml
	sub	a0,a2
	jrlt	trylyup		;In front of me?
o2dok

dunk	move	a3,*a13(plyr_dir)
	movi	-1,a14
	move	a14,*a13(plyr_newdir)	;Cancel turn

	addk	8,a3			;Round off
	srl	4,a3			;Kill frac
	sll	5,a3			;*32


	move	*a13(plyr_ownball),a5
	jrp	noalya				;br=teammate doesn't have ball !!

	move	*a13(plyr_tmproc_p),a14,L
	move	*a14(plyr_seqflgs),a0
	btst	DUNK_B,a0			;is teammate in dunk ?
	jrnz	tmdnk				;br=yes
	move	*a14(plyr_ohpdist),a14		;get teammates dist. from hoop
	cmpi	375,a14				;passer not in view of basket

	jrhs	plyr_startjmp_x				;br=teammate too far away!!




	move	@PSTATUS2,a0		;Plyr start bits 0-3
	move	*a13(plyr_num),a1
	btst	a1,a0
	jrz	I_drone

	move	*a13(plyr_PDATA_p),a2,L	;Shrink turbo meter for this plyr
	move	*a2(ply_turbo),a1
	subk	TURBO_CNT/7,a1		;Min cnt for alley oop


	jrle	x_red			;Turbo too low?
	move	a1,*a2(ply_turbo)

	jruc	cont_aly

I_drone
	xori	1,a1
	btst	a1,a0
	jrz	cont_aly		;Br=2 drones on same team - allow it


	.ref	balltmshotcnt
	move	@balltmshotcnt,a0	;Maybe. Chk shot cnt
	subk	TMFIRE_MINCNT,a0
	jrnn	cont_aly		; br=a team is on-fire

	move	@drone_attempt,a0
	jrnz	plyr_startjmp_x
	movk	1,a0
	move	a0,@drone_attempt

	move	*a13(plyr_alley_cnt),a0
	cmpi	3,a0
	jrge	plyr_startjmp_x


cont_aly

	CREATE	flashpid,flash_me
	move	a13,*a0(PDATA+32),L
	move	*a13(plyr_attrib_p),a14,L
	move	*a14(PAT_DUNKSKILL),a14
	subk	3,a14			;if less than 3 dunk rating do layup alley
	jrgt	nrmaly

	movi	ALLEYOOP10_SEQ,a0		;dir 1
	move	*a13(plyr_seqdir),a14
	jrz	qucklay2			;br=direction 1
	movi	ALLEYOOP14_SEQ,a0		;dir 5
	cmpi	4,a14
	jreq	qucklay2			;br=direction 5
	movi	ALLEYOOP11_SEQ,a0		;dir 2
	cmpi	1,a14
	jreq	qucklay2
	cmpi	7,a14
	jreq	qucklay2
	movi	ALLEYOOP13_SEQ,a0		;dir 4
	cmpi	3,a14				;dir 4 or 8 ?
	jreq	qucklay2			;br=yes
	cmpi	5,a14				;dir 4 or 8 ?
	jreq	qucklay2			;br=yes
	movi	ALLEYOOP12_SEQ,a0		;dir 3
	jruc	qucklay2
nrmaly
	movi	ALLEYOOP8_SEQ,a0
	move	*a13(plyr_seqdir),a14
	jrz	qucklay2			;br=direction 1
	movi	ALLEYOOP9_SEQ,a0
	cmpi	4,a14
	jreq	qucklay2			;br=direction 5
	movi	ALLEYOOP7_SEQ,a0		;br=yes
	cmpi	1,a14
	jreq	qucklay2
	cmpi	7,a14
	jreq	qucklay2
	movi	ALLEYOOP5_SEQ,a0		;br=yes
	cmpi	3,a14				;dir 4 or 8 ?
	jreq	qucklay2			;br=yes
	cmpi	5,a14				;dir 4 or 8 ?
	jreq	qucklay2			;br=yes
	callr	get_rndm_alleyoop_seq		;ret. a0 = alleyoop seq.
	jruc	qucklay2			;br=not in direction 1
tmdnk




	CREATE	flashpid,flash_me
	move	a13,*a0(PDATA+32),L

	movi	DDUNK_RECV_SEQ,a0
	jruc	qucklay

 SUBRP	flash_me

	SLEEPK	3
	move	*a13(PDATA+32),a0,L	;Player proc ptr

	move	*a0(plyr_inflsh),a14
	jrnz	flash_me

	SLEEPK	4

	move	*a13(PDATA+32),a0,L	;Player proc ptr
	move	*a0(plyr_jmpcnt),a0
	jaz	SUCIDE
	movk	1,a14
	move	a14,*a0(plyr_inflsh)

	move	*a8(OPAL),a0
	move	a0,*a13(PDATA)

	.ref	white_pal
	movi	white_pal,a0
	calla	pal_getf
	move	a0,*a13(PDATA+16)

	move	*a8(OPLINK),a0,L
	move	*a0(plyr_headobj_p),a9,L
	move	*a9(OPAL),a11

	movk	3,a10
again
	move	*a13(PDATA+32),a0,L	;Player proc ptr
	move	*a0(plyr_lost_ptr),a14,L
	move	*a14(PA8),a1,L		;a8=0 if no side arw on or arw obj ptr
	jrz	no_arw

	movi	00101H,a2
	move	a2,*a1(OCONST)
	setf	4,0,0
	movk	M_CONNON,a0		;Replace non-zero data with constant
	move	a0,*a1(OCTRL)		;Write 4 low bits
	setf	16,1,0
no_arw

	move	*a13(PDATA+16),a0
	move	a0,*a8(OPAL)
	move	a0,*a9(OPAL)

	SLEEPK	3

	move	*a13(PDATA+32),a0,L	;Player proc ptr
	move	*a0(plyr_lost_ptr),a14,L
	move	*a14(PA8),a1,L		;a8=0 if no side arw on or arw obj ptr
	jrz	no_arw2

	setf	4,0,0
	movk	M_WRNONZ,a0
	move	a0,*a1(OCTRL)		;Write 4 low bits
	setf	16,1,0

no_arw2

	move	*a13(PDATA),a0
	move	a0,*a8(OPAL)
	move	a11,*a9(OPAL)

	SLEEPK	3

	dsj	a10,again

	clr	a14
	move	*a13(PDATA+32),a0,L	;Player proc ptr
	move	a14,*a0(plyr_inflsh)

	DIE

 SUBRP	flash_me_red

	move	*a13(PDATA+32),a0,L	;Player proc ptr
	move	*a0(plyr_jmpcnt),a14
	janz	SUCIDE
	movk	2,a14
	move	a14,*a0(plyr_inflsh)

	move	*a8(OPAL),a0
	move	a0,*a13(PDATA)

	.ref	red_pal
	movi	red_pal,a0
	calla	pal_getf
	move	a0,*a13(PDATA+16)

	move	*a8(OPLINK),a0,L
	move	*a0(plyr_headobj_p),a9,L
	move	*a9(OPAL),a11

	movk	2,a10
again1
	move	*a13(PDATA+16),a0
	move	a0,*a8(OPAL)
	move	a0,*a9(OPAL)

	SLEEPK	3

	move	*a13(PDATA),a0
	move	a0,*a8(OPAL)
	move	a11,*a9(OPAL)

	SLEEPK	3

	dsj	a10,again1

	clr	a14
	move	*a13(PDATA+32),a0,L	;Player proc ptr
	move	a14,*a0(plyr_inflsh)

	DIE

noalya
	move	*a13(plyr_tbutn),a14
	cmpi	4,a14			;just pressed turbo ?
	jrgt	dodnk			;br=no, do a dunk

	move	*a13(plyr_ohpdist),a14	
	cmpi	95,a14			;too close for QUICK LAYUP ?
	jrlt	dodnk			;br=yes, do dunk

	movk	2,a0
	move	a0,@ballptsforshot

	movk	LAY_UP,a0
	move	a0,@shot_type

	movi	QUICK_LAYUP_SEQ,a0
	jruc	qucklay
dodnk

	.ref	getdunkseq
	calla	getdunkseq
	move	a0,a0
	jrnz	sj


	clr	a0
	move	a0,@shot_distance

	movk	DUNK_SHORT,a0
	cmpi	80,a4
	jrle	short

	movk	DUNK_MED,a0
	cmpi	120,a4
	jrle	med

	movk	DUNK_LONG,a0
short
med
	move	a0,@shot_type

	.if DEBUG
	movi	DUNKA_SEQ,a0
	movi	DUNKA2_SEQ,a0
	movi	DUNKA3_SEQ,a0
	movi	DUNKB_SEQ,a0
	movi	DUNKB2_SEQ,a0
	movi	DUNKB3_SEQ,a0
	movi	DUNKC_SEQ,a0
	movi	DUNKD_SEQ,a0
	movi	DUNKD2_SEQ,a0
	movi	DUNKE_SEQ,a0
	movi	DUNKE2_SEQ,a0
	movi	DUNKF_SEQ,a0
	movi	DUNKG_SEQ,a0
	movi	DUNKG2_SEQ,a0
	movi	DUNKJ_SEQ,a0
	movi	DUNKJ2_SEQ,a0
	movi	DUNKK_SEQ,a0
	movi	DUNKK2_SEQ,a0
	movi	DUNKL_SEQ,a0
	movi	DUNKL2_SEQ,a0
	movi	DUNKL3_SEQ,a0
	movi	DUNKN_SEQ,a0
	movi	DUNKN2_SEQ,a0
	movi	DUNKN3_SEQ,a0
	movi	DUNKO_SEQ,a0
	movi	DUNKO2_SEQ,a0
	movi	DUNKP_SEQ,a0
	movi	DUNKP2_SEQ,a0
	movi	DUNKP3_SEQ,a0
	movi	DUNKQ_SEQ,a0
	movi	DUNKQ2_SEQ,a0
	movi	DUNKQ3_SEQ,a0
	movi	DUNKR_SEQ,a0
	movi	DUNKR2_SEQ,a0
	movi	DUNKS_SEQ,a0
	movi	DUNKS2_SEQ,a0
	movi	DUNKT_SEQ,a0
	movi	DUNKT2_SEQ,a0
	movi	DUNKT3_SEQ,a0
	movi	DUNKT4_SEQ,a0
	movi	DUNKT5_SEQ,a0
	movi	DUNKU_SEQ,a0
	movi	DUNKU2_SEQ,a0
	movi	DUNKU3_SEQ,a0
	movi	DUNKV_SEQ,a0
	movi	DUNKV2_SEQ,a0
	movi	DUNKV3_SEQ,a0
	movi	DUNKV4_SEQ,a0
	movi	DUNKW_SEQ,a0
	movi	DUNKW2_SEQ,a0
	movi	DUNKW3_SEQ,a0
	movi	DUNKX_SEQ,a0
	movi	DUNKX2_SEQ,a0
	movi	DUNKX3_SEQ,a0
	movi	DUNKY_SEQ,a0
	movi	DUNKY2_SEQ,a0
	movi	DUNKZ_SEQ,a0
	movi	DUNKZ2_SEQ,a0
	movi	DUNKZ3_SEQ,a0
	movi	DUNKLAY_SEQ,a0
	movi	DUNKLAY2_SEQ,a0
	movi	DUNKLAY3_SEQ,a0
	movi	DUNKLAY3A_SEQ,a0
	movi	DUNKLAY3B_SEQ,a0
	movi	DUNKLAY3C_SEQ,a0
	movi	DUNKLAY4_SEQ,a0
	movi	DUNKLAY5_SEQ,a0
	movi	DUNKLAY6_SEQ,a0
	movi	DUNKLAY7_SEQ,a0
	movi	DUNKLAY7A_SEQ,a0
	movi	DUNKLAY8_SEQ,a0
	movi	DUNKT4_SEQ,a0
	movi	DUNKU4_SEQ,a0
	movi	DUNKU5_SEQ,a0
	movi	DUNKU6_SEQ,a0
	movi	DUNKU7_SEQ,a0
	movi	DUNKU8_SEQ,a0

	movi	1,a2

	jrn	tstdnk
	.endif

	move	*a3,a2,L
	move	*a2+,a0			;Entries-1
	callr	rndrng0
	sll	4,a0			;*16
	add	a2,a0
	move	*a0,a0
	jrz	sj			;Null entry?
tstdnk


	.if	DEBUG
	.bss	debug_dunk_num,16
	.ref	slowmotion

	move	a0,@debug_dunk_num
	clr	a1
	move	a1,@slowmotion
	.endif

	move	a0,a2
	CREATE0	start_animate
nosmk	move	a2,a0

qucklay
	movk	2,a14
	move	a14,@ballptsforshot
qucklay2
	move	*a13(plyr_dir),a7
	callr	plyr_setseq		;Dunk!

	move	*a13(plyr_num),a14
	srl	1,a14
	jrz	    plyr_startjmp_x			;Team1?
	movi	M_FLIPH,a14
	move	a14,*a13(plyr_anirevff)
	jruc	plyr_startjmp_x



dnkthru_t
	.word	0,0,0,0,0,0,0,100,150,250,350


dist_t	.word	40*DIST_REDUCTION
	.WORD	43*DIST_REDUCTION
	.WORD	46*DIST_REDUCTION
	.WORD	49*DIST_REDUCTION
	.WORD	50*DIST_REDUCTION
	.WORD	52*DIST_REDUCTION
	.WORD	54*DIST_REDUCTION
	.WORD	56*DIST_REDUCTION
	.WORD	68*DIST_REDUCTION
	.WORD	70*DIST_REDUCTION
	.WORD	72*DIST_REDUCTION
	.WORD	95*DIST_REDUCTION
width_t
	.word	27,29,31,33,36,37,38,39,40,43,45,70

trylyup
	move	*a13(plyr_ownball),a14
	jrn	sj_red			;alleyoop
	move	@HCOUNT,a14
	btst	0,a14
	jrnz	sj
	move	*a13(plyr_ohpdist),a14
	cmpi	138*DIST_ADDITION,a14
	jrgt	sj
	cmpi	35*DIST_ADDITION,a14
	jrlt	sj

	move	a3,*a13(plyr_dir)
	movi	-1,a14
	move	a14,*a13(plyr_newdir)	;Cancel turn
	movk	2,a0
	move	a0,@ballptsforshot

	movk	FINGER_ROLL,a0
	move	a0,@shot_type

	movi	LAYUP_SEQ,a0
	jruc	sseq

hs
	movk	2,a4
	move	a4,@ballptsforshot

	movk	HOOK_SHOT,a0
	move	a0,@shot_type

	movk	HOOK_SEQ,a0
	move	*a13(plyr_turbon),a4
	jrnz	hs1
	movk	HOOK2_SEQ,a0		;Not a high arc


hs1	move	*a13(plyr_dir),a7
	callr	plyr_setseq

	move	*a13(plyr_seqdir),a14
	subk	2,a14
	jrz	plyr_startjmp_x

	move	*a13(plyr_num),a14
	srl	1,a14
	jrz	plyr_startjmp_x			;Team1?
	movi	M_FLIPH,a14
	move	a14,*a13(plyr_anirevff)
	jruc	plyr_startjmp_x



sj					;>Start a jump shot seq
	move	*a13(plyr_ownball),a5
	jrnn	sj2
	move	a9,*a13(plyr_newdir)	;Turn toward basket
	jruc	plyr_startjmp_x

sj_red
	move	a9,*a13(plyr_newdir)	;Turn toward basket
	jruc	x_red




sj2
	.asg	CZMIN+18,PT3_TOPZ

	movk	2,a4			;Assume 2ptr

	move	*a8(OZPOS),a0
	subi	PT3_TOPZ,a0
	jrlt	i3ptra
	cmpi	PT3_CNT*4,a0,W
	jrge	i3ptra

	.if 0			;DEBUG code for 3pt line positioning
	BSSX	pt3_tval,16
	srl	2,a0
	move	a0,a1
	sll	4,a0
	addi	pt3_t,a0
	move	*a0,a0
	move	a0,@pt3_tval
	dec	a0
	move	*a13(plyr_num),a14
	subk	2,a14
	jrlt	3pt1
	neg	a0
3pt1	addi	WRLDMID,a0
	move	*a8(OXANI+16),a14
	sub	a14,a0
	move	a0,*a8(OXPOS)
	sll	2,a1
	addi	PT3_TOPZ,a1
	move	a1,*a8(OZPOS)
	clr	a0
	move	a0,*a13(plyr_nojoy)
	movk	STNDDRIB_SEQ,a0
	jruc	sseq
	.endif			;DEBUG end

	srl	2,a0			;In 3pt arc Z range
	sll	4,a0
	addi	pt3_t,a0
	move	*a0,a0
	move	*a8(OXANI+16),a14
	move	*a8(OXPOS),a2
	add	a14,a2
	subi	WRLDMID,a2
	abs	a2
	sub	a2,a0			;Inside 3pt line?
	jrle	z2ptra			; br=yes

	cmpi	25,a0			;22+15%;!!!
	jrlt	s3ptrx
i3ptr
	movk	1,a4
	move	a4,@reduce_3ptr
i3ptra

s3ptrx
	movk	3,a4			;Is 3ptr

	movk	_3_POINTS,a0
	move	*a13(plyr_ohpdist),a14
	cmpi	290*DIST_ADDITION,a14
	jrle	contxy

	movk	LONG_RANGE,a0
	jruc	contxy
z2ptra
	movk	_2_POINTS,a0


contxy
	move	a0,@shot_type
	move	a4,@ballptsforshot

	movk	UNDR_HOOP_SHT_SEQ,a0	;for team 2
	move	*a13(plyr_num),a14
	srl	1,a14
	jrnz	tem2				;br=team1
	movk	UNDR_HOOP_SHT_SEQ2,a0
tem2
	.ref	chck_plyr_under_hoop
	calla	chck_plyr_under_hoop
	jrc	sseq

	movk	SHOOT_SEQ,a0
	move	*a13(plyr_shtbutn),a14
	jrnz	sseq

	movk	QSHOOT_SEQ,a0
	movk	1,a14
	move	a14,*a13(plyr_shtbutn)
	jruc	sseq


desp
	movi	DESPERATION,a0
	move	a0,@shot_type

	movk	3,a14
	move	a14,@ballptsforshot

	movk	SHOOTDESP2_SEQ,a0	;Heave
	move	@PCNT,a14
	btst	0,a14
 	jrz	abc
	movk	SHOOTDESP_SEQ,a0	;Heave
abc
	move	@game_time,a14,L
	cmpi	0500H,a14
	jrlt	heave_a			;Do it


	movi	SHOOTDESP3_SEQ,a0

heave_a
	move	*a13(plyr_newdir),a14
	move	a14,*a13(plyr_dir)
	movi	-1,a14
	move	a14,*a13(plyr_newdir)
	jruc	sseq

blk

	move	*a13(plyr_rcvpass),a0
	jrgt	plyr_startjmp_x			;Waiting on pass?

	move	*a13(plyr_offtime),a14
	jrnz	plyr_startjmp_x			;br=offscreen, dont jump

	move	@ballpnum,a14
	jrn	inair			;br=no owner

	sll	5,a14			;*32
	addi	plyrproc_t,a14
	move	*a14,a14,L
	move	*a14(plyr_seqflgs),a0
	btst	SHOOT_B,a0
	jrnz	inair


	move	*a8(OXVEL),a0,L
	sra	1,a0
	move	a0,*a8(OXVEL),L
	move	*a8(OYVEL),a0,L
	sra	1,a0
	move	a0,*a8(OYVEL),L
	move	*a8(OZVEL),a0,L
	sra	1,a0
	move	a0,*a8(OZVEL),L

	move	@ballobj_p,a5,L
	move	*a5(OXPOS),a6
	addk	6,a6
	move	*a5(OZPOS),a7
	PUSH	A0
	callr	seekdirdist_obxz128
	move	a0,*a13(plyr_newdir)	;Turn toward ball
	PULL	A0
	btst	DUNK_B,a0
	jrz	blkd
	movk	7,a0
	calla	rndrng0
	sll	4,a0
	addi	blktype_t,a0
	move	*a0,a0


	jruc	sseq

blktype_t
	.word	BLOCK_SEQ,BLOCK_SEQ,BLOCK_SEQ,BLOCK_SEQ
	.word	REBOUND_SEQ,BLOCKREJ_SEQ
	.word	REBOUND_SEQ,FASTBLOCKREJ_SEQ

inair

	move	@ballshotinair,a1
	jrn	nstm			;br=ball hit something !!
	move	*a13(plyr_num),a14
	srl	1,a14
	srl	1,a1
	cmp	a14,a1
	jreq	dorb			;br=plyrs, not on same team !!
nstm
	move	@ballobj_p,a5,L

	move	*a5(OYPOS),a1
	cmpi	-40,a1
	jrge	faceb			;Ball close to gnd?

	move	*a5(OXVAL),a6,L
	move	*a5(OXANI),a14,L
	add	a14,a6
	move	*a5(OZVAL),a7,L

	move	@ballpnum,a14
	jrge	chkdist		;Other team has ball?

	movk	20,a0
	move	*a5(OXVEL),a1,L
	mpys	a0,a1
	add	a1,a6
	move	*a5(OZVEL),a1,L
	mpys	a0,a1
	add	a1,a7

chkdist
	sra	16,a6
	sra	16,a7
	callr	seekdirdist_obxz128
	move	a0,*a13(plyr_newdir)	;Turn where ball is headed
	cmpi	120,a1
	jrge	blkd			;Too far to jump?

	movi	650,a0
	move	@ballpnum,a1
	jrge	dornd

	move	@ballgoaltcnt,a14
	jrle	dorb			;Do rebound?



	movi	650,a0
dornd	calla	RNDPER
	jrhi	dorej

	move	*a13(plyr_attrib_p),a14,L
	move	*a14(PAT_DEFSKILL),a0
	cmpi	5,a0
	jrlt	dorej

dorb	movk	REBOUND_SEQ,a0
	jruc	sseq
dorej
	movk	BLOCKREJ_SEQ,a0
	jruc	sseq


faceb	move	@ballobj_p,a5,L
	move	*a5(OXPOS),a6
	addk	6,a6
	move	*a5(OZPOS),a7
	callr	seekdirdist_obxz128
	move	a0,*a13(plyr_newdir)	;Turn toward ball
	move	*a13(plyr_balldist),a0
	cmpi	024H,a0
	jrgt	blkd
	movi	PICKUP_SEQ,a0		;No. Pick-up ball
 	jruc	sseq

blkd	movk	BLOCK_SEQ,a0


sseq	move	*a13(plyr_dir),a7
	callr	plyr_setseq


plyr_shoot_x	
    PULL	a6,a7,a9
	rets


x_red
	move	*a13(plyr_inflsh),a0
	jrnz	plyr_startjmp_x	

	move	@PSTATUS2,a0		;Plyr start bits 0-3
	move	*a13(plyr_num),a1
	btst	a1,a0
	jrz	    plyr_startjmp_x	


	CREATE	flashpid,flash_me_red
	move	a13,*a0(PDATA+32),L

plyr_startjmp_x	
	PULL	a6,a7,a9
	rets

pt3_t
	.word	336,276,248,235,222,213,204,196
	.word	188,182,176,163,158,155,152,149
	.word	146,143,141,140,139,138,137,137
	.word	136,136,136,135,135,135,135,135
	.word	136,137,137,138,138,139,140,141
	.word	141,142,144,145,147,148,150,151
	.word	153,155,158,161,164,168,171,174
	.word	177,180,183,186,189,193,197,201
	.word	205,210,215,220,226,231,238,245
	.word	254,262,272,286,316
PT3_CNT	.equ	($-pt3_t)/16

	.if CRTALGN
	.word	-1
	.endif



 SUBRP	get_rndm_alleyoop_seq

	PUSH	a1
 	movk	4,a0
	calla	rndrng0
	sll	    4,a0
	addi	alleyoop_seq_tbl,a0
	move	*a0,a0
	PULL	a1
 	rets

alleyoop_seq_tbl
	.word	ALLEYOOP1_SEQ
	.word	ALLEYOOP2_SEQ
	.word	ALLEYOOP3_SEQ
	.word	ALLEYOOP4_SEQ
	.word	ALLEYOOP6_SEQ


 SUBR	plyr_shoot

	PUSH	a6,a7,a9,a10,a11

	.ref	bkbrd_proc_flg
	clr	a14
	move	a14,@bkbrd_proc_flg	;just in case speech proc was killed

	move	*a13(plyr_num),a0	;Exit if plyr doesn't have
	move	@ballpnum,a1	 	; the ball
	cmp	a0,a1
	jrne	plyr_shoot_x

	clr	a1
	move	*a13(plyr_seq),a14
	cmpi	ALLEYOOP1_SEQ,a14	;Take care to update here when alley
	jrlo	nally			; seq's are changed or added!!!
	cmpi	ALLEYOOP14_SEQ,a14	;This stuff is elsewhere too!!!
	jrhi	nally
	movk	1,a1
nally
	BSSX	was_alley_shot,16
	move	a1,@was_alley_shot


	move	@plyr_onfire,a14	;Do on-fire shot snd?
	btst	a0,a14
	jrnz	fire			; br=on-fire
	move	*a13(plyr_hotspotp),a14	;Do sound for hotspot shot?
	jrz	cold			; br=no
	move	a0,a14			;Chk hotspot shot cnt
	sll	4,a14
	.ref	hotspot_count
	addi	hotspot_count,a14
	move	*a14,a14
	subk	HOTSPOT_MINCNT,a14
	jrlt	cold			; br=hotspot not active yet
fire
	SOUND1	fball_snd
cold
	move	@ballobj_p,a0,L

	move	*a13(plyr_ballyo),a1
	cmpi	-200,a1			;Ball Y free?
	jrne	notfree		; br=no
	move	@ballfree,a14		;Yes. Was it already free?
	jrnz	contv			; br=yes

	.if DEBUG
	LOCKUP				;Should not occur!
	.endif

	movk	1,a14
	move	a14,@ballfree		;!0=ball free
	move	*a0(OYPOS),a1
	move	*a0(OIMG),a14,L
	move	*a14(IANIOFFY),a14
	add	a14,a1			;A1=ball ctr Y
	movi	-0a00H,a14		;Push it towards gnd
	mpys	a14,a1
	addi	016000H,a1
	move	a1,*a0(OYVEL),L
	jruc	contv

notfree
	clr	a1
	move	a1,*a0(OYVEL),L		;Clr vels
	move	a1,*a0(OXVEL),L
	move	a1,*a0(OZVEL),L
	move	a1,@ballfree		;0=ball not free

contv
	move	*a13(plyr_ohoopx),a6
	movi	CZMID,a7
	callr	seekdirdist_obxz128
	move	a0,a10			;A10=hoop dir
	move	a1,a11			;A11=hoop distance

	move	*a13(plyr_attrib_p),a7,L	;Get plyr shot % attribute
	move	*a7(PAT_SHOTSKILL),a9

	move	@ballptsforshot,a0
	cmpi	3,a0
	jrnz	no3



	.ref	SHT5
	cmpi	SHT5,a9
	jrgt	oui
	subi	200,a9			;!!! ;Stat 0-4 reduce 3-ptrs
oui
	move	@reduce_3ptr,a0
	jrz	no3
	subi	150,a9			;!!!150?;Reduce 3-ptr


no3
	cmpi	112,a11			;!!! ;Close-in?
	jrgt	notshort
	addi	250,a9			;!!! ;Improve for close-in
notshort
	cmpi	304,a11			;!!! ;Far shot?
	jrlt	notlong
	subi	990,a9			;!!! ;Reduce for far shot

notlong
	move	*a13(plyr_num),a4	;>Process opponents dir/dist
	srl	2,a4
	subb	a4,a4
	addk	1,a4
	sll	1+5,a4
	addi	plyrobj_t,a4

	movk	2,a5
chkopp
	move	*a4+,a0,L
	move	*a0(OYPOS),a3
	callr	seekdirdist_obob128

	cmpi	50,a1	;40		;!!! ;Opponent tight-in, any angle?
	jrgt	s1far			; br=no
	subi	240,a9			;!!!
s1far
	cmpi	85,a1	;75		;!!! ;Opponent close-in?
	jrgt	nxtopp			; br=no
	sub	a10,a0			;Yes. Process my hoop angle with his
	abs	a0			; angle on me
	cmpi	040H,a0
	jrle	p1dsml
	subi	080H,a0
	abs	a0
p1dsml
	subk	20,a0			;!!! ;Between me & hoop?
	jrge	nxtopp			; br=no
	sll	2,a1			;!!! = 0   to 300
	subi	390,a1			;!!! =-390 to -90	;350

	move	*a8(OYPOS),a2
	sub	a3,a2			;Shooter above opponent?
	jrle	s1above			; br=yes
	addk	8,a2
	mpys	a2,a1
	sra	3,a1
s1above
	add	a1,a9			;Decrease accuracy
nxtopp
	dsj	a5,chkopp

	move	a11,a14			;Decrease shot % per hoop distance
	sll	1,a14			;!!!
	sub	a14,a9

	cmpi	50,a9			;!!! ;Ensure valid minimun shot %
	jrge	minok
	movi	50,a9			;!!!
minok

	move	*a13(plyr_num),a0	;Get plyr brick cnt
	sll	4,a0
	addi	brick_count,a0
	move	*a0,a1
	cmpi	3,a1			;!!! ;If too many in a row, make this
	jrlt	nobrick		; shot go in
 .if DEBUG
	LOCKUP
 .endif ;DEBUG

	cmpi	304,a11			;!!! ;Far shot?
	jrgt	nobrick

	movi	990,a9			;!!! ;Set best shot %
nobrick

	move	*a13(plyr_ptsdown),a1	;0AdHjust shot % per score diff
	move	a1,a2			;A2=plyr_ptsdown
	movk	15,a0	;12 ;14 ;15		;!!! ;% factor
	mpys	a0,a1
	add	a1,a9

	cmpi	50,a9
	jrge	minok1
	movi	50,a9
minok1

	move	a2,a2			;Is plyr losing?
	jrgt	nomis			; br=yes
	movi	55,a0			;!!! ;Randomly knock down his %
	calla	RNDPER
	jrls	nomis
	movi	350,a9			;!!!
nomis
	move	@game_time,a1,L
	cmpi	0400H,a1			;!!! ;Last seconds of qrtr?
	jrgt	nohelp			; br=no


	move	@gmqrtr,a3

	move	a2,a0			;Game tied?
	jrnz	notie			; br=no

	subk	3,a3			;In 4th qrtr or OT?
	jrlt	nohelp			; br=no
	movi	50,a9			;!!! ;Last second shot of a tie game
	jruc	nohelp			; should almost never go in
notie
	jrgt	tryhelp		;Is plyr losing? br=yes

	addk	5,a0			;!!! ;Winning by 5 or more?
	jrgt	nohelp			; br=no
	subk	3,a3			;In 4th qrtr or OT?
	jrlt	nohelp			; br=no
	cmpi	0200H,a1			;How close to qrtr being over?
	jrgt	endgbig		;Last few seconds
	jruc	willtie		;At the buzzer
tryhelp
	move	@ballptsforshot,a14
	subk	3,a3			;In 4th qrtr or OT?
	jrge	endgame		; br=yes

	subk	5,a0			;!!! ;Losing by more than 5?
	jrgt	losebig		; br=yes

	cmp	a2,a14			;Will this shot tie the game?
	jreq	willtie		; br=yes

	movi	100,a3			;!!! ;Min % down 1-5, no tie shot
	jruc	chkper
willtie
	movi	120,a3			;!!! ;Min % down 1-5, is tie shot
	jruc	chkper
losebig
	movi	120,a3			;!!! ;Min % down 05H
	jruc	chkper

endgame
	subk	4,a0			;!!! ;Losing by 4 or more?
	jrge	endgbig		; br=yes

	cmp	a2,a14			;Will this shot tie the game?
	jreq	endgtie		; br=yes

	move	*a13(plyr_num),a0
	move	@PSTATUS2,a1
	btst	a0,a1			;Is plyr a drone?
	jrnz	endgnod		; br=no
	movk	1,a14
	xor	a14,a0
	btst	a0,a1			;Is team mate a drone too?
	jrnz	endgnod		; br=no

	movi	100,a3			;!!! ;Min % drones down <4, no tie shot
	jruc	chkper
endgnod
	movi	380,a3			;!!! ;Min % down <4, no tie shot
	jruc	chkper
endgtie
	movi	800,a3			;!!! ;Min % for down <4, is tie shot
	jruc	chkper
endgbig
	movi	300,a3			;!!! ;Min % for down 03H

chkper
	cmp	a3,a9			;Set min % if > current %
	jrge	nohelp
	move	a3,a9


nohelp

	move	@ballobj_p,a7,L		;Is ball on fire?
	move	*a7(OPLINK),a0,L
	move	*a0(ball_onfire),a14
	jrz	nofire			; br=no

	addi	750,a9			;!!! ;On-fire % increase
	cmpi	328,a11
	jrlt	nofire
	movi	100,a9			;!!! ;On-fire & close-in % increase
nofire
	move	*a13(plyr_hotspotp),a14	;Add any hotspot shot% bump
	add	a14,a9

	calla	ball_convfmprel


	move	*a13(plyr_seq),a0	;0AdHjust % per plyr seq
	cmpi	DDUNK_STRT2_SEQ,a0
	jrnz	ntddnk2
	movi	500,a9			;!!!
	jruc	fixperc
ntddnk2
	cmpi	DUNKLAY5_SEQ,a0
	jrnz	ck2
	addi	760,a9			;!!!
	jruc	fixperc
ck2
	cmpi	DUNKLAY4_SEQ,a0
	jrnz	ck3
	addi	760,a9			;!!!
	jruc	fixperc
ck3
	cmpi	DUNKLAY3_SEQ,a0
	jrnz	ck4
	addi	760,a9			;!!!
	jruc	fixperc
ck4
	cmpi	DUNKLAY2_SEQ,a0
	jrnz	ck6
	addi	760,a9			;!!!
	jruc	fixperc
ck6
	cmpi	DUNKLAY3A_SEQ,a0
	jrnz	ck6a
	addi	760,a9			;!!!
	jruc	fixperc
ck6a
	cmpi	DUNKLAY6_SEQ,a0
	jrnz	ck7
	addi	760,a9			;!!!
fixperc


	jruc	fixde

ck7
	cmpi	LAYUPREB_SEQ,a0
	jreq	ly			;Layup?
	cmpi	DUNKLAY_SEQ,a0
	jreq	ly			;Layup?
	cmpi	LAYUP_SEQ,a0		;Put back layup
	jreq	ly
	move	*a13(plyr_seqflgs),a14	;Chk funky new layups
	btst	LAYUP_B,a14
	jrz	noly
ly
	movi	800,a9			;!!! ;Base shot % for layup

	move	*a13(plyr_ptsdown),a1
	subk	2,a1
	jrge	noairb			;Losing by 2 or more? No airball

	move	*a13(plyr_ptsdown),a1	;Is plyr losing?
	jrgt	noms			; br=yes

	movi	100,a0			;!!! ;Pull down % sometimes
	calla	RNDPER
	jrls	noms
	movi	650,a9			;!!!
noms
	jruc	fixde

noly
	cmpi	HOOK_SEQ,a0
	jreq	hk
	cmpi	HOOK2_SEQ,a0
	jrne	nohk
hk
	movi	600,a9			;!!! ;Base shot % for hook

	movi	120,a0			;!!! ;Pull down % sometimes
	calla	RNDPER
	jrls	fixde
	movi	450,a9			;!!!

nohk
fixde


	move	a10,a3			;A3=hoop dir (0-7F)
	move	a11,a1			;A1=hoop dist
	sll	32-6,a3			;Throw out dir msb for range of (0-3F)
	srl	32-6,a3
	subk	020H,a3			;Make dir be just angle offset from
	abs	a3			; dirs (0base) 2 or 6 (0-1F)

	move	*a13(plyr_ohpdist),a14	;distance from hoop
	move	a14,@shot_distance
	movk	1,a14
	move	a14,@shot_percentage	;start at 100%


	clr	a0
	.ref	must_rebound
	move	a0,@must_rebound


	.if DEBUG
	movk	1,a14
	move	a14,@pup_showshotper
	.endif
	move	@pup_showshotper,a14
	jrz	nosp

	PUSH	a1,a2,a7,a8,a9,a10

	move	@crplate_ptr,a2,L
	move	*a2(ODATA_p),a7,L
	jrz	makesp

	callr	make_ssp_ptrs

	move	*a7(PA10),a8,L
	move	*a8(OCTRL),a1
	move	*a10,a0,L
	calla	obj_aniq_cnoff

	move	*a7(PA8),a8,L
	move	*a8(OCTRL),a1
	move	*a9,a0,L
	calla	obj_aniq_cnoff

	movi	TSEC*2,a0
	move	a0,*a7(PTIME)
	jruc	madesp
makesp
	CREATE	06000H,plyr_showshotpercent
	move	a0,*a2(ODATA_p),L
madesp
	PULL	a1,a2,a7,a8,a9,a10
nosp


	movk	1,a10			;A10=normal shot arc

	PUSH	a1
	movk	16,a0			;!!! All shots chance of flat arc
	calla	RNDPER
	jrls	noflat0
	clr	a10			;A10=flat shot arc
noflat0
	move	*a13(plyr_seqflgs),a14
	btst	LAYUP_B,a14		;Doing a lay-up?
	jrz	noflat			; br=no
	movi	100,a0			;!!! Lay-up chance of flat arc
	calla	RNDPER
	jrls	noflat
	clr	a10			;A10=flat shot arc
noflat
	PULL	a1



	subk	018H,a3			;!!! Would bank angle be too steep?
	jrge	athoop			; br=yes, don't bank

	move	@plyr_onfire,a0		;Is someone on-fire?
	jrnz	athoop			; br=yes, don't bank

	cmpi	100,a1			;!!! Too far for short bank?
	jrgt	longshot		; br=yes


	move	*a13(plyr_seq),a14
	cmpi	DUNKLAY5_SEQ,a14	;In a seq that wants a short bank?
	jrz	offbb			; br=yes

	movk	4,a0			;!!! 20% chance
	addk	8,a3			;More in front of board?
	jrlt	fmfront		; br=yes
	movk	3,a0			;!!! 25% chance for steeper angles
fmfront
	callr	rndrng0
	move	a0,a0			;Beat the odds?
	jrnz	athoop			; br=no, don't bank

offbb					;0CHlose bank shot
	movk	15,a10			;!!! 1 in 16 chance of flat arc

	movi	-10,a4			;!!! =X offset
	movi	-8,a5			;!!! =Y offset
	movk	2,a6			;!!!

	movi	999,a0
	callr	rndrng0
	and	a0,a10			;A10=flat shot arc
	cmp	a0,a9			;Beat shot % odds?
	jrgt	cbgood			; br=yes
cbbad
	movk	3,a0			;Randomize X offset for some misses
	callr	rndrng0
	addk	1,a0
	sll	1,a0
	sub	a0,a4
	movk	1,a0			;Randomize Z offset for some misses
	callr	rndrng0
	sll	4,a0
	subk	8,a0
	move	a0,a2
	jruc	cbdxdy

cbgood
	move	*a7(OZPOS),a3
	subi	CZMID,a3		;=ball Z delta from hoop
	sll	8,a3

	move	*a7(OXPOS),a14
	move	*a7(OIMG),a1,L
	move	*a1(IANIOFFX),a1
	add	a1,a14			;=ball ctr X
	move	*a13(plyr_ohoopx),a1
	sub	a14,a1			;=ball X delta from hoop
	abs	a1
	jrz	cbnodiv		; br=delta X=0 (should never be)?
	divs	a1,a3
cbnodiv
	mpys	a6,a3
	sra	8,a3
	move	a3,a2			;=Z offset
cbdxdy
	move	a4,a0			;=X offset
	move	a5,a1			;=Y offset
	jruc	calcshot

longshot				;>Long bank shot
	addk	8,a3			;!!! Would bank angle be too steep?
	jrge	athoop			; br=yes, don't bank

	movk	3,a0			;!!! 75% chance
	callr	rnd			;Beat the odds?
	jrnz	athoop			; br=no, don't bank

	movi	-12,a4			;!!! =X offset
	movi	-10,a5			;!!! =Y offset
	movk	2,a6			;!!!

	movi	999,a0
	callr	rndrng0
	cmp	a0,a9			;Beat shot % odds?
	jrgt	cbgood			; br=yes
	jruc	cbbad			;Make shot miss


athoop
	cmpi	55,a9			;25
	jrge	notlng
	cmpi	0148H,a11
	jrlt	notlng

	movi	120,a0			;250
	calla	RNDPER
	jrls	noairb
	jruc	airok
notlng
	movk	01fH,a0			;3%
	cmpi	55,a11
	jrge	chkairb		;Not a close shot?
	movi	07fH,a0			;1.5%
chkairb
	callr	rnd
	jrnz	noairb			;No air ball?

	move	*a13(plyr_ptsdown),a0
	subk	2,a0
	jrge	noairb			;Losing by 2 or more? No airball

	move	@plyr_onfire,a14	;Is someone on-fire?
	jrnz	noairb			; br=yes, don't do airball


	move	*a13(plyr_o1dist),a14	;Totally open shot?
	cmpi	50*DIST_REDUCTION,a14
	jrlt	airok
	move	*a13(plyr_o2dist),a14
	cmpi	50*DIST_REDUCTION,a14
	jrgt	noairb
airok

	movi	-1,a0
	move	a0,@plyrairballoff

	move	a7,a2
	CREATE0	plyr_airballsnd
	movi	-1,a0
	move	a0,@shot_percentage	;miss
	move	a2,a7

	movk	20,a2			;0AHir ball ;18
	movk	1,a0
	callr	rnd
	jrnz	airf
	neg	a2			;-Z
airf
	clr	a0			;=X offset
	clr	a1			;=Y offset

	jruc	calcshot


noairb
	movi	999,a0			;>Shoot at hoop
	callr	rndrng0
	addi	50,a9			;Adj for better %
	cmp	a0,a9			;Beat shot % odds?
	jrgt	good			; br=yes, make shot score

miss
	clr	a0
	move	a0,@shot_percentage	;miss

	movk	01fH,a0			;Miss
	callr	rnd
	sll	4,a0
	addi	misszx_t,a0
	move	*a0,a5
	move	*a0(8*16),a3

	movk	1,a0			;50%
	callr	rnd
	jrnz	miss2

	movk	2,a0			;More towards rim edge
	callr	rndrng0
	addk	6,a0			;7 ;Vel multiplier range
	jruc	miss3
miss2
	movk	3,a0			;Regular miss (they go in a fair amount)
	callr	rnd
	addk	4,a0			;6 ;Vel multiplier range
miss3
	mpys	a0,a3
	mpys	a0,a5
	move	a3,a0
	move	a5,a2
	sra	12,a0			;=X offset
	sra	12,a2			;=Z offset

	jruc	cyo

good
	movk	4,a0			;>Make shot score
	callr	rndrng0
	subk	2,a0
	move	a0,a2			;=Z offset

	movk	4,a0
	callr	rndrng0
	subk	2,a0			;=X offset
cyo
	movi	-3,a1			;=Y offset


calcshot
	move	*a13(plyr_ohoopx),a3
	cmpi	WRLDMID,a3
	jrlt	lhoop
	neg	a0
lhoop
	add	a0,a3			;Add X offset
	move	*a7(OXPOS),a14
	move	*a7(OIMG),a5,L
	move	*a5(IANIOFFX),a5
	add	a5,a14			;=ball ctr X
	sub	a14,a3			;X delta

	movi	CZMID,a5
	add	a2,a5
	move	*a7(OZPOS),a14
	sub	a14,a5			;Z delta

	move	a1,a2

	move	a3,a4			;0CaHlc distance (long+short/2.667)
	move	a5,a14
	abs	a4
	abs	a14
	cmp	a14,a4
	jrhs	xbig1
	SWAP	a14,a4
xbig1
   	sra	1,a14			;/2
	add	a14,a4
	sra	2,a14			;/8
	sub	a14,a4

	cmpi	170,a4
	jrls	distok
	move	a4,a14			;>Reduce excess
	movi	170,a4
	sub	a4,a14
	sra	3,a14			;/8
	add	a14,a4
distok
	move	a4,a1
	movi	110,a14			;120
	mpys	a14,a1
	move	a1,a4
	sra	8,a4			;/256

	movi	50,a14			;!!! Min tick for normal shot arc
	move	a10,a10			;Normal or flat shot arc?
	jrnz	chkmin			; br=normal
	movi	35,a14			;!!! Min tick for flat shot arc
	move	a4,a1			;Reduce tick cnt 25% to flatten shot
	sra	2,a1
	sub	a1,a4
chkmin
	cmp	a14,a4
	jrge	divok
	move	a14,a4

divok
	move	*a13(plyr_seq),a1
	move	*a13(plyr_seqflgs),a14
	btst	LAYUP_B,a14
	jrz	hkck


	move	@HCOUNT,a14
	btst	0,a14
	jrz	hko
	subk	10,a4
	jruc	hko

hkck
	cmpi	HOOK_SEQ,a1
	jrnz	hky
	addk	15,a4			;Make hook shot go a bit higher
	jruc	hko
hky
	cmpi	HOOK2_SEQ,a1
	jrnz	hko
	subk	10,a4
hko
	addk	2,a4
	movk	10,a0
	calla	RNDPER
	jrls	regshot
	move	@shot_distance,a0

	cmpi	0104H,a0
	jrgt	regshot
	addk	20,a4

	SOUND1	rainbow_sp

regshot
	sll	16,a3
	sll	16,a5
	divs	a4,a3
	divs	a4,a5


	move	@plyrairballoff,a0
	jrnn	nobrick1
	clr	a0
	move	a0,@plyrairballoff

	clr	a0
	move	a0,@ballgoaltcnt

	move	a3,a0
	sra	2,a0
	sub	a0,a3
nobrick1
	move	a3,*a7(OXVEL),L

	move	a5,*a7(OZVEL),L

	movi	-GRAVB/2,a1
	mpys	a4,a1
	move	*a7(OYVAL),a3,L		;Adjust for hgt difference
	addi	HOOPY-8,a2
	sll	16,a2
	sub	a2,a3			;- if above
	divs	a4,a3
	sub	a3,a1

	move	a1,*a7(OYVEL),L

	addk	2,a4

	move	a4,@ballgoaltcnt

	move	*a13(plyr_num),a1	;A1=Plyr 
	move	a1,@ballpnumshot
	move	a1,@ballpnumlast
	move	a1,@ballsclastp
	move	a1,@ballshotinair	;Shooter  if shot in air, else -1

	clr	a0
	move	a0,@ballprcv_p,L
	move	a0,@ballscorezhit
	move	a0,@ballrimhitcnt
	move	a0,@ballbbhitcnt
	move	a0,@plyrcharge
	move	a0,*a13(plyr_ownball)
	not	a0			;=-1
	move	a0,@ballpnum		;No owner

	movi	45,a0			;40
	move	a0,*a13(plyr_shtdly)
					;>Inc try shot stat

	move	@ballptsforshot,a0
	subk	2,a0
	jrle	ignre
	move	*a13(plyr_tmproc_p),a0,L
	move	*a0(plyr_num),a14
	move	@PSTATUS2,a9
	btst	a14,a9
	jrnz	ignre			;br=a human teammate
	move	*a0(plyr_seq),a14
	cmpi	ALLEYOOP1_SEQ,a14
	jrlo	ignre
	cmpi	ALLEYOOP14_SEQ,a14
	jrhi	ignre
	movi	2*TSEC,a14			;roughly 2 seconds.
	move	a14,*a0(plyr_shtdly)
ignre
	move	*a13(plyr_seqflgs),a0
	btst	LAYUP_B,a0
	jrnz	plyr_startjmp_x2            ;!!AM!! need to debug this, probably wrong, too many x's..

	movi	PS_2PTS_TRY,a0
	move	@ballptsforshot,a14
	subk	2,a14
	jreq	i_2ptrb
	movk	PS_3PTS_TRY,a0
i_2ptrb
   	calla	inc_player_stat

plyr_startjmp_x2
	move	*a13(plyr_num),a0	;Plyr  shooting
	calla	shoots_speech

	PULL	a6,a7,a9,a10,a11
	rets


misszx_t
	.word	-4096,-4017,-3784,-3406,-2896,-2275,-1567,-799
	.word	0,799,1567,2275,2896,3406,3784,4017
	.word	4096,4017,3784,3406,2896,2275,1567,799
	.word	0,-799,-1567,-2275,-2896,-3406,-3784,-4017
	.word	-4096,-4017,-3784,-3406,-2896,-2275,-1567,-799



 SUBR	make_ssp_ptrs

	movk	10,a10
	divu	a10,a9

	cmpi	99,a9
	jrls	maxok
	movi	99,a9
maxok
	clr	a8
	divu	a10,a8
	sll	5,a8
	sll	5,a9
	movi	f_t,a10
	add	a10,a9
	add	a8,a10

	rets

f_t
	.long	font60,font61,font62,font63,font64
	.long	font65,font66,font67,font68,font69



 SUBRP	plyr_showshotpercent


	.if DEBUG
	cmpi	5700,a9
	jrlo	pss
pss
	.endif

	callr	make_ssp_ptrs

	move	*a10,a2,L
	movi	[SCOREBRD_X+26,0],a0
	movi	[SCOREBRD_Y+13,0],a1
	movi	SCOREBRD_Z,a3
	movi	DMAWNZ|M_NOCOLL|M_SCRNREL,a4
	movi	CLSDEAD,a5
	clr	a6
	clr	a7
	calla	BEGINOBJ2
	move	a8,a10

	move	*a9,a2,L
	movi	[SCOREBRD_X+32,0],a0
	movi	[SCOREBRD_Y+13,0],a1
	calla	BEGINOBJ2

	movi	SHOTPER,a9,L		;Change credit plate
	move	@crplate_ptr,a11,L
	move	*a9(ISAG),*a11(OSAG),L

	SLEEP	TSEC*2

	move	*a11(OIMG),a9,L		;Restore previous credit plate
	move	*a9(ISAG),*a11(OSAG),L
	clr	a9
	move	a9,*a11(ODATA_p),L


	move	a10,a0
	calla	DELOBJ
	jauc	DELOBJDIE




 SUBRP	plyr_airballsnd

	SLEEP	80

	move	@plyrairballoff,a0
	jrnz	plyr_airballsnd_x
	.ref	crwd_arbl_sp
	SOUND1	crwd_arbl_sp

	movk	4,a0
	calla	rndrng0
	sll	5,a0
	addi	airbl_sp_tbl,a0
	move	*a0,a0,L
	calla	snd_play1
plyr_airballsnd_x	DIE

airbl_sp_tbl
	.long	airball_sp
	.long	sht_stunk_sp
	.long	misd_mile_sp
	.long	way_shrt_sp
	.long	misd_evry_sp



 SUBRP	plyr_startpass

	PUSH	a6,a7

	move	*a13(plyr_tmproc_p),a4,L

	move	*a4(plyr_seqflgs),a14
	btst	DUNK_B,a14
	jrz	psp1a				;br=not dunk,in air = no pass

	move	*a13(plyr_seqflgs),a14
	btst	DUNK_B,a14
	jrnz	plyr_startpass_x				;br=both in dunk = no pass

	jruc	contd
psp1a
	move	*a4(plyr_jmpcnt),a0
	jrnz	plyr_startpass_x
contd
	move	*a13(plyr_seqdir),a14
	move	a14,*a13(plyr_old_seqdir)

	move	*a13(plyr_num),a1
	inc	a1
	move	a1,@assist_plyr
	movi	3*60+30,a0
	move	a0,@assist_delay

	move	a10,a2
	move	a4,a10
	calla	arw_on1plyr		;Guy who picks up ball gets arw
	move	a2,a10
	move	a4,@ballprcv_p,L

	move	*a4(PA8),a2,L		;Get teammates obj
	move	*a2(OXPOS),a6
	move	*a2(OXANI+16),a14
	add	a14,a6
	move	*a2(OZPOS),a7

	move	*a4(plyr_seqflgs),a14
	btst	DUNK_B,a14
	jrz	psp2				;br=teammate not in a dunk

	move	*a4(plyr_slam_ticks),a2
	move	*a4(plyr_jmpcnt),a14
	sub	a14,a2
	jrle	plyr_startpass_x				;br=to late for pass
	subk	26,a2				;at least 25 ticks b4 slam ?
	jrle	plyr_startpass_x				;br=no
	
	callr	seekdirdist_obxz128
	move	a0,*a13(plyr_newdir)		;Turn toward alley-ooper

	clr	a2
	move	*a13(plyr_ptsdown),a14
	addk	3,a14
	jrge	losing
	movi	100,a0				;Make alleys doink sometimes
	calla	RNDPER				; if plyr is ahead
	jrls	losing
	movi	500,a2
losing
	move	a2,@shot_distance
	movi	ALLEYOOP_PAS_SEQ,a0
	move	*a13(plyr_jmpcnt),a14
	jrz	reg3
	movi	PASSDO_SEQ,a0
	move	*a13(plyr_tmdist),a14
	cmpi	110*DIST_REDUCTION,a14
	jrgt	reg3
	movi	PASSDO2_SEQ,a0

reg3

	move	*a13(plyr_newdir),a7	;Turn toward alley-ooper
	callr	plyr_setseq
	movi	-1,a3
	jruc	bhin

psp2
	move	@inbound,a0
	jrnn	notnl4			;Inbounding the ball?



	movi	200,a0
	calla	RNDPER
	jrls	notnl4			;BR=nope

	move	*a13(plyr_jmpcnt),a14
	jrnz	notnl4			;In air?

	move	*a13(plyr_tmdist),a14
	cmpi	90*DIST_REDUCTION,a14
	jrlt	notnl4			;Too short?
	subi	320*DIST_REDUCTION,a14
	jrgt	notnl4			;Too far?

nlcont



	callr	seekdirdist_obxz128
	move	a1,a2


	move	a0,a14
	addi	040H,a14
	sll	32-7,a14
	srl	32-7,a14

	addk	8,a0			;Round off
	sll	32-7,a0
	srl	32-7+4,a0		;Kill frac

	move	*a13(plyr_seqdir),a1

	cmpi	0,a1
	jrnz	nldir2

	cmpi	2,a0
	jrz	nldo1


	cmpi	6,a0
	jrnz	notnl4

	movi	PASSNL_SEQ,a0
	move	a0,a3
	callr	plyr_setseq

	movi	M_FLIPH,a3
	move	a3,*a13(plyr_anirevff)
	clr	a3
	dec	a3
	jruc	bhconta
nldo1
	movi	PASSNL_SEQ,a0
	move	a14,*a4(plyr_newdir)
	move	*a13(plyr_dir),a7
	jruc	bhpas


nldir2					;2 direction possibility
	cmpi	1,a1
	jrnz	nldir2a

	cmpi	2,a0
	jrz	nldo2
	cmpi	3,a0
	jrnz	nldir2a

nldo2
	movi	PASSNL_SEQ,a0
	move	a14,*a4(plyr_newdir)
	move	*a13(plyr_dir),a7
	jruc	bhpas


nldir2a
	cmpi	7,a1
	jrnz	nldir3

	cmpi	5,a0
	jrz	nldo2
	cmpi	6,a0
	jrz	nldo2

nldir3
	cmpi	2,a1
	jrnz	nldir3a

	cmpi	4,a0
	jrnz	nldir3a

nldo3
	movi	PASSNL_SEQ,a0
	move	a14,*a4(plyr_newdir)
	move	*a13(plyr_dir),a7
	jruc	bhpas


nldir3a
	cmpi	6,a1
	jrnz	nldir4

	cmpi	4,a0
	jrz	nldo3


nldir4
	cmpi	3,a1
	jrnz	nldir4a

	cmpi	5,a0
	jrnz	nldir4a

nldo4
	movi	PASSNL_SEQ,a0
	move	a14,*a4(plyr_newdir)
	move	*a13(plyr_dir),a7
	jruc	bhpas


nldir4a
	cmpi	5,a1
	jrnz	nldir5

	cmpi	3,a0
	jrz	nldo4

nldir5
	cmpi	4,a1
	jrnz	notnl4

	cmpi	6,a0
	jrnz	nldir5a

nldo5
	movi	PASSNL_SEQ,a0
	move	a14,*a4(plyr_newdir)
	move	*a13(plyr_dir),a7
	jruc	bhpas


nldir5a

	cmpi	2,a0
	jrnz	notnl4

	movi	PASSNL_SEQ,a0
	move	a0,a3
	callr	plyr_setseq

	movi	M_FLIPH,a3
	move	a3,*a13(plyr_anirevff)
	clr	a3
	dec	a3
	jruc	bhconta


notnl4



 	movi	350,a0
	calla	RNDPER
	jrls	notbh

	move	*a13(plyr_jmpcnt),a14
	jrnz	notbh			;In air?

	move	*a13(plyr_tmdist),a14
	cmpi	90*DIST_REDUCTION,a14
	jrlt	notbh			;Too short?
	subi	360*DIST_REDUCTION,a14
	jrgt	notbh			;Too far?

	move	*a13(plyr_attrib_p),a14,L
	move	*a14(PAT_PASS),a14
	cmpi	5,a14
	jrlt	notbh

	move	*a13(plyr_o1dist),a1
 	cmpi	078H*DIST_REDUCTION,a1
	jrlt	notbh
	move	*a13(plyr_o2dist),a1
	cmpi	078H*DIST_REDUCTION,a1
	jrlt	notbh
 

	move	@inbound,a0
	jrn	bhcont			;Inbounding the ball?


	move	*a13(plyr_ptsdown),a1
	jrgt	notbh			;If losing, don't bhpass
	addk	6,a1
	jrge	notbh			;If ahead by 7 or more, allow attempt
bhcont
 



	callr	seekdirdist_obxz128
	move	a1,a2


	move	a0,a14
	addi	040H,a14
	sll	32-7,a14
	srl	32-7,a14

	addk	8,a0			;Round off
	sll	32-7,a0
	srl	32-7+4,a0		;Kill frac

	move	*a13(plyr_seqdir),a1

	cmpi	0,a1
	jrnz	dir2

	cmpi	1,a0
	jrz	do1
	cmpi	2,a0
	jrz	do1


	cmpi	6,a0
	jrz	do1a
	cmpi	7,a0
	jrnz	notbh

do1a
	movi	PASSBH_SEQ,a0
	move	a0,a3
	callr	plyr_setseq

	movi	M_FLIPH,a3
	move	a3,*a13(plyr_anirevff)
	clr	a3
	dec	a3
	jruc	bhconta
do1
	movi	PASSBH_SEQ,a0
	move	a14,*a4(plyr_newdir)
	move	*a13(plyr_dir),a7
	jruc	bhpas


dir2					;2 direction possibility
	cmpi	1,a1
	jrnz	dir2a

	cmpi	1,a0
	jrz	do2
	cmpi	2,a0
	jrnz	dir2a
do2
	movi	PASSBH_SEQ,a0
	move	a14,*a4(plyr_newdir)
	move	*a13(plyr_dir),a7
	jruc	bhpas

dir2a
	cmpi	7,a1
	jrnz	dir3

	cmpi	6,a0
	jrz	do2
	cmpi	7,a0
	jrz	do2


dir3
	cmpi	1,a1
	jrnz	dir3a

	cmpi	0,a0
	jrz	do3
	cmpi	7,a0
	jrnz	dir3a
do3
	movi	PASSBH2_SEQ,a0
	move	a14,*a4(plyr_newdir)
	move	*a13(plyr_dir),a7
	jruc	bhpas

dir3a
	cmpi	7,a1
	jrnz	dir4

	cmpi	0,a0
	jrz	do3
	cmpi	1,a0
	jrz	do3

dir4
	cmpi	2,a1
	jrnz	dir4a

	cmpi	2,a0
	jrz	do4
	cmpi	3,a0
	jrnz	dir4a
do4
	movi	PASSBH_SEQ,a0
	move	a14,*a4(plyr_newdir)
	move	*a13(plyr_dir),a7
	jruc	bhpas
dir4a
	cmpi	6,a1
	jrnz	dir5

	cmpi	5,a0
	jrz	do4
	cmpi	6,a0
	jrz	do4

dir5
	cmpi	2,a1
	jrnz	dir5a

	cmpi	0,a0
	jrz	do5
	cmpi	1,a0
	jrnz	dir5a
do5
	movi	PASSBH2_SEQ,a0
	move	a14,*a4(plyr_newdir)
	move	*a13(plyr_dir),a7
	jruc	bhpas
dir5a
	cmpi	6,a1
	jrnz	dir6

	cmpi	0,a0
	jrz	do5
	cmpi	7,a0
	jrz	do5

dir6
	cmpi	3,a1
	jrnz	dir6a

	cmpi	3,a0
	jrz	do6
	cmpi	4,a0
	jrz	do6
	cmpi	5,a0
	jrnz	dir6a
do6
	movi	PASSBH_SEQ,a0
	move	a14,*a4(plyr_newdir)
	move	*a13(plyr_dir),a7
	jruc	bhpas
dir6a
	cmpi	5,a1
	jrnz	dir7

	cmpi	3,a0
	jrz	do6
	cmpi	4,a0
	jrz	do6
	cmpi	5,a0
	jrz	do5
dir7
	cmpi	3,a1
	jrnz	dir7a

	cmpi	2,a0
	jrz	do7
	cmpi	3,a0
	jrnz	dir7a
do7
	movi	PASSBH2_SEQ,a0
	move	a14,*a4(plyr_newdir)
	move	*a13(plyr_dir),a7
	jruc	bhpas
dir7a
	cmpi	5,a1
	jrnz	dir8

	cmpi	5,a0
	jrz	do7
	cmpi	6,a0
	jrz	do7

dir8
notbh
	callr	seekdirdist_obxz128	;>Turn toward teammate
	move	a0,*a13(plyr_dir)

	move	a0,*a13(plyr_newdir)

	move	a0,a7
	move	a0,a3

	addi	040H,a0
	sll	32-7,a0
	srl	32-7,a0
	move	a0,*a4(plyr_newdir)
	move	a1,a2

	movi	PASSDO_SEQ,a0

	move	*a13(plyr_jmpcnt),a14
	jrz	contpass


	move	*a13(plyr_seqflgs),a14
	btst	DUNK_B,a14
	jrz	nodnk

	PUSH	a0

	movk	PS_DUNKS_TRY,a0		;0DecH dunk stats
	move	*a13(plyr_num),a1
	.ref	dec_player_stat
	calla	dec_player_stat
	movi	PS_2PTS_TRY,a0
	move	*a13(plyr_num),a1
	calla	dec_player_stat

	PULL	a0

nodnk

	move	*a13(plyr_tmdist),a14
	cmpi	110*DIST_REDUCTION,a14
	jrgt	ss
	movi	PASSDO2_SEQ,a0
	jrnz	ss			;Air dish off pass?
contpass

	movi	PASSS_SEQ,a0
	cmpi	170*DIST_ADDITION,a2			;50
	jrle	ss


	movi	PASSC_SEQ,a3

	move	*a13(plyr_attrib_p),a14,L
	move	*a14(PAT_PASS),a5
	cmpi	6,a5
	jrlt	normp
	movi	FASTPASSC_SEQ,a3
normp
	movk	7,a0
	callr	rnd
	jrnz	normchest		;12% regular chest?
	movi	PASSNEWOH_SEQ,a3
	cmpi	6,a5
	jrlt	normchest
	movi	FASTPASSNEWOH_SEQ,a3
normchest
	move	a3,a0

ss
bhpas
	.if	DEBUG
	jruc	skipem
	movi	PASSS_SEQ,a0	     ;Short pass
	movi	PASSC_SEQ,a0	     ;Long chest pass
	movi	FASTPASSC_SEQ,a0     ;Fast long chest pass
	movi	PASSDO_SEQ,a0	     ;Dish off
	movi	PASSDO2_SEQ,a0	     ;Dish off no big arm extend
	movi	PASSNL_SEQ,a0	     ;No look pass
	movi	PASSC_SEQ,a0	     ;Long chest pass
	movi	FASTPASSNEWOH_SEQ,a0 ;Fast new overhead pass
	movi	PASSBH_SEQ,a0	     ;Behind back pass
	movi	PASSNEWOH_SEQ,a0     ;New overhead pass

	movi	PASSC_SEQ,a0	     ;Long chest pass
skipem
	.endif

	move	a0,a3

	move	*a13(plyr_tmdist),a14
	cmpi	170,a14
	jrgt	bhconta

	callr	plyr_setseq

bhconta

	cmpi	PASSNL_SEQ,a3
	jrnz	noleadnl
	jrz	lead_nl

lead_nl
	move	*a4(plyr_dirtime),a1
	jrz	nolead_nl
	subk	10,a1			;10
	jrlt	nolead_nl

noleadnl


	move	*a4(plyr_dirtime),a1
	jrz	nolead_notm


	subk	8,a1			;8
	jrgt	leadingpass

	move	*a4(plyr_o1dist),a0

	cmpi	25*DIST_ADDITION,a0
	jrlt	nolead_ocls		;Opponent too close?
	move	*a4(plyr_o2dist),a0
	cmpi	25*DIST_ADDITION,a0
	jrge	leadingpass



	cmpi	30*DIST_ADDITION,a2		;30
	jrlt	nolead_tm		;Too close?
	move	*a4(plyr_dirtime),a1
	subk	4,a1
	jrgt	leadingpass

nolead_notm
	move	@PCNT,a0

	ANDK	1,a0
	jruc	nolead_a
	jruc	leadingpass

nolead_nl
	jruc	nolead_a

nolead_ocls
	jruc	nolead_a

nolead_tm


nolead_a
	movk	1,a0
	move	a0,*a4(plyr_nojoy)

	jruc	end


leadingpass
	move	*a4(plyr_jmpcnt),a1
	jrnz	nolead			;He's jumping?







	move	*a13(plyr_tmproc_p),a4,L
	move	*a4(PA8),a2,L		;Get teammates obj
	move	*a2(OXPOS),a6
	move	*a2(OXANI+16),a14
	add	a14,a6
	move	*a2(OZPOS),a7

	move	*a2(OXVEL),a0,L		;Where will teammate be in 32 ticks?
	sra	16-5,a0

	move	*a2(OXVEL),a14,L
	sra	15,a14
	add	a14,a0


	add	a0,a6
	move	*a2(OZVEL),a0,L
	sra	16-5,a0


	move	*a2(OZVEL),a14,L
	sra	15,a14
	add	a14,a0


	add	a0,a7

	callr	seekdirdist_obxz128	;>Turn toward where teammate will be
	move	a0,*a13(plyr_dir)
	move	a0,*a13(plyr_newdir)


bhin
	move	*a4(PA11),a0,L		;>Keep teammate moving in same dir
	move	*a0,a0
	sll	32-4,a0
	srl	32-4,a0
	ori	08000H,a0
	move	a0,*a4(plyr_nojoy)	;Neg
	move	a0,*a4(plyr_newdir)

end


	move	*a4(PA8),a1,L		;>Keep teammate moving in same dir
	move	*a1(OZPOS),a0
	cmpi	CZMIN+8,a0
	jrgt	upok
	movi	CZMIN+10,a0
	move	a0,*a1(OZPOS)
	jruc	ck_ok

upok	cmpi	CZMAX-6,a0		;stupid K!!! ;Is Z ok? Yes if <
	jrlt	dnok
	movi	CZMAX-8,a0		;stupid K!!! ;Is Z ok? Yes if <
	move	a0,*a1(OZPOS)
	jruc	ck_ok

dnok

ck_ok

	move	a3,a3			;Alley oop type pass?
	jrn	no

	move	*a13(plyr_tmdist),a14
	cmpi	170,a14
	jrle	no

	move	*a13(plyr_dir),a7
	move	a3,a0
	callr	plyr_setseq

no

	movk	30,a0
	move	a0,*a4(plyr_rcvpass)

	move	*a4(plyr_seqflgs),a0
	btst	SAMEDIR_B,a0
	jrz	    plyr_startpass_x
	movi	-1,a0
	move	a0,*a4(plyr_newdir)	;Kill dir change


plyr_startpass_x	PULL	a6,a7
	rets



 SUBR	plyr_lob_ball

	PUSH	a6,a9,a10,a11,a12

	move	*a13(plyr_tmproc_p),a6,L
	move	*a6(plyr_seq),a14
	cmpi	DDUNK_RECV_SEQ,a14
	jrne	shtbl				;br=player not in correct seq.
	move	*a6(plyr_slam_ticks),a4
	move	*a6(plyr_jmpcnt),a14
	sub	a14,a4				;ticks before reach rim
	jrn	shtbl				;br=player cant recv. pass

	movk	10,a0
	calla	rndrng0
	addk	10,a0
	sub	a0,a4
	jrn	shtbl				;br=not enough time...

	calla	ball_convfmprel
	move	@ballobj_p,a0,L

	move	*a6(PA8),a8,L			;Get * teammates obj
	move	*a8(OXVAL),a3,L
	move	*a8(OXANI),a14,L
	add	a14,a3
	move	*a8(OXVEL),a1,L

	move	*a8(OZVAL),a5,L
	move	*a8(OZVEL),a14,L

	move	*a8(OYVAL),a10,L
	move	*a8(OYVEL),a9,L

	move	a4,b0				;0CaHlc where ball should go

poslp	add	a1,a3				;Walk through movements
	add	a14,a5	
	add	a9,a10	
	addi	GRAVB,a9

	subk	1,b0				;1 step
	jrgt	poslp
outb
	move	*a0(OZVAL),a1,L
	sub	a1,a5				;Z delta

	move	*a0(OXVAL),a1,L
	sub	a1,a3				;X delta

	divs	a4,a3
	divs	a4,a5

	move	a3,*a0(OXVEL),L
	move	a5,*a0(OZVEL),L

	move	a10,a3			;- if ball above dest
	move	*a0(OYVAL),a10,L	;Adjust for hgt difference
	sub	a10,a3			;- if ball above dest
	move	a4,a5

	movi	-GRAVB/2,a1
	mpys	a4,a1
	divs	a4,a3
	add	a3,a1
	move	a1,*a0(OYVEL),L

	move	*a13(PA8),a8,L

	clr	a14
	move	a14,@plyrpasstype	;0=Normal, !0=Turbo

	move	*a13(plyr_num),a1
	inc	a1
	move	a1,@assist_plyr
	movi	3*60+30,a0
	move	a0,@assist_delay

	subk	3,a5
	move	a5,*a6(plyr_shtdly)

	move	a6,@ballprcv_p,L

	move	*a13(plyr_num),a0
	move	a0,@ballpnumshot
	move	a0,@ballpnumlast
	move	a0,@ballsclastp
	movi	-1,a0
	move	a0,@ballpnum		;No owner
	move	a0,@ballshotinair	;Shooter  if shot in air, else -1
	clr	a0
	move	a0,@ballscorezhit
	move	a0,@ballbbhitcnt
	move	a0,@ballpasstime
	move	a0,*a13(plyr_ownball)

	movk	30,a0
	move	a0,*a13(plyr_shtdly)

	movk	2,a14			;Make alley-oops always 2 ptrs
	move	a14,@ballptsforshot
	movk	DUNK_LONG,a14
	move	a14,@shot_type

	move	@plyr_onfire,a14
	move	*a13(plyr_num),a5
	btst	a5,a14
	jrnz	npasa			;br=plyr not on fire

	.ref	lob_ball_speech
	calla	lob_ball_speech
	jruc	plyr_lob_ball_x
npasa
	movi	fpass_snd,a0,L
	calla	snd_play1


plyr_lob_ball_x	PULL	a6,a9,a10,a11,a12
	rets

shtbl
	callr	plyr_shoot

	movi	swith_hnd_sp,a0,L
	move	@HCOUNT,a14
	btst	0,a14
	jrnz	shtbl2
	movi	spn_shtup_sp,a0,L
shtbl2
	calla	snd_play1

	PULL	a6,a9,a10,a11,a12
	rets



 SUBR	plyr_pass

	PUSH	a6,a9,a10,a11,a12

	move	@ballpnum,a0
	move	*a13(plyr_num),a1
	cmp	a0,a1
	jrne	plyr_pass_x			;I don't have ball?

	calla	ball_convfmprel

	move	@ballobj_p,a0,L

	move	*a13(plyr_tmproc_p),a6,L
	move	*a6(PA8),a2,L		;Get * teammates obj

	move	*a2(OXPOS),a3
	move	*a2(OXANI+16),a14
	add	a14,a3
	move	*a2(OZPOS),a5

	move	*a0(OXPOS),a1
	move	*a0(OXANI+16),a14
	add	a14,a1
	sub	a1,a3			;X delta
	move	*a0(OZPOS),a1
	sub	a1,a5			;Y delta

	move	a3,a4			;0CaHlc distance (long+short/2.667)
	move	a5,a14
	abs	a4
	abs	a14
	cmp	a14,a4
	jrhs	xbig
	SWAP	a14,a4
xbig	sra	1,a14			;/2
	add	a14,a4
	sra	2,a14			;/8
	sub	a14,a4

	PUSH	a0

	move	@inbound,a0
	jrnn	no_speech

	cmpi	100,a4			;too close to call
	jrlt	no_speech

	move	*a13(plyr_num),a1
	calla	pass_to_speech

no_speech
	PULL	a0

	move	*a13(plyr_attrib_p),a14,L
	move	*a14(PAT_PASS),a2
	sll	4,a2
	movi	longpas_t,a1
	add	a2,a1
	move	*a1,a1	


	cmpi	300,a4
	jrgt	ct_a

	movi	shortpas_t,a1
	add	a2,a1
	move	*a1,a1	



ct_a
   	move	*a13(plyr_turbon),a14
	jrz	noturb2			;No turbo?
	addi	turbopas_t,a2
	move	*a2,a2
	sub	a2,a1


noturb2
	move	a14,@plyrpasstype	;0=Normal, !0=Turbo

	mpys	a4,a1
	sra	10,a1			;/1024
	move	a1,a4
	subk	16,a1
	jrge	nshrt			;!Short?
	movk	16,a4			;Min
nshrt

	move	*a6(PA8),a2,L		;Get * teammates obj

	move	*a2(OYVAL),a10,L
	move	*a6(plyr_seq),a14
	cmpi	ALLEYOOP1_SEQ,a14	;M1SPDU1-20 frames
	jrlo	noalyb
	cmpi	ALLEYOOP14_SEQ,a14
	jrhi	noalyb
	movk	2,a14			;Make alley-oops always 2 ptrs
	move	a14,@ballptsforshot
	movk	DUNK_LONG,a14
	move	a14,@shot_type
	move	a4,b0			;0CaHlc where ball should go
	move	*a2(OXVAL),a3,L
	move	*a2(OXANI),a14,L
	add	a14,a3
	move	*a2(OZVAL),a5,L
	move	*a2(OXVEL),a1,L
	move	*a2(OZVEL),a14,L
	move	*a2(OYVEL),a9,L

vellp	add	a1,a3			;Walk through movements
	add	a14,a5	
	add	a9,a10	
	addi	GRAVB,a9
	subk	1,b0			;1 step
	jrgt	vellp
	jruc	outb
noalyb


	move	*a6(plyr_nojoy),a14
	jrnn	nolead
ledpas
	move	a4,b0			;0CaHlc where ball should go
	move	*a2(OXVAL),a3,L
	move	*a2(OXANI),a14,L
	add	a14,a3
	move	*a2(OZVAL),a5,L

	move	*a2(OXVEL),a1,L
	move	*a2(OZVEL),a14,L

	move	*a2(OYVEL),a9,L

bndlp	add	a1,a3			;Walk through movements
	add	a14,a5	
	add	a9,a10	
	addi	GRAVB,a9
	cmpi	(PLYRMINX)<<16,a3
	jrle	outb2
	cmpi	(PLYRMAXX)<<16,a3
	jrge	outb2
	cmpi	(CZMIN+8)<<16,a5
	jrle	outb3
	cmpi	(GZMAX-6)<<16,a5
	jrge	outb3

	subk	1,b0			;1 step
	jrgt	bndlp

	jruc	outb4

outb3
	add	a1,a3
	add	a14,a5
	add	a9,a10
	addi	GRAVB,a9

	add	a1,a3
	add	a14,a5
	add	a9,a10
	addi	GRAVB,a9
outb2
	add	a1,a3
	add	a14,a5
	add	a9,a10
	addi	GRAVB,a9

	add	a1,a3
	add	a14,a5
	add	a9,a10
	addi	GRAVB,a9
outb4
	sra	16,a3
	sra	16,a5

	move	*a6(plyr_jmpcnt),a14
	jrnz	chkoop			;In jump?
	move	*a2(OYVAL),a10,L	;Not an alley-oop. Restore YVAL
	jruc	nooff

chkoop
	clr	a1
	clr	a11
	clr	a12

	move	*a6(plyr_seq),a14
	cmpi	ALLEYOOP1_SEQ,a14	;M1SPDU1-20 frames
	jrne	nxtd1
	movi	-9,a1			;y pos additive
	movk	22,a11
	movi	-33,a12
	jruc	drevs
nxtd1
	cmpi	ALLEYOOP2_SEQ,a14	;W3FLDU1-13 frames
	jrne	nxtd2
	movi	-48,a1			;y pos additive
	movi	-18,a11
	movk	3,a12
	jruc	drevs
nxtd2
	cmpi	ALLEYOOP3_SEQ,a14	;W3CRZDU2-20 frames
	jrne	nxtd3
	movi	-1,a1			;y pos additive
	movi	-5,a11
	movk	5,a12
	jruc	drevs
nxtd3
	cmpi	ALLEYOOP4_SEQ,a14	;S3BKDU1-16
	jrne	nxtd4
	movi	-37,a1			;y pos additive
	movk	5,a11
	movi	-5,a12
	jruc	drevs
nxtd4
	cmpi	ALLEYOOP5_SEQ,a14	;M3SPRDU1-11 frames
	jrne	nxtd5
	movi	-50,a1			;y pos additive
	movk	10,a11
	movi	-20,a12
	jruc	drevs
nxtd5
	cmpi	ALLEYOOP6_SEQ,a14	;W3SPNDU1-21 frames
	jrne	nxtd6
	movi	-35,a1			;y pos additive
	movk	5,a11
	movi	-10,a12
	jruc	drevs
nxtd6
	cmpi	ALLEYOOP7_SEQ,a14	;W3SPNDU1-21 frames
	jrne	nxtd7
	movi	-50,a1			;y pos additive
	movi	-14,a11			;norm. X additive
	movk	5,a12			;flip X additive
	jruc	drevs
nxtd7
	cmpi	ALLEYOOP8_SEQ,a14	;only angle 1
	jrne	nxtd8
	movi	-60,a1			;y pos additive
	movk	30,a11
	movi	-30,a12
	jruc	drevs

nxtd8
	cmpi	ALLEYOOP9_SEQ,a14	;only angle 5 
	jrne	nxtd9
	movi	-33,a1			;y pos additive
	movk	25,a11			;x pos additive
	movi	-25,a12
	jruc	drevs
nxtd9
	cmpi	ALLEYOOP10_SEQ,a14	;only angle 1, <5 dnk rating
	jrne	nxtd10
	movi	-47,a1			;y pos additive
	movk	25,a11			;x pos additive
	movi	-25,a12
nxtd10
	cmpi	ALLEYOOP11_SEQ,a14	;only angle 2, <5 dnk rating
	jrne	nxtd11
	movi	-23,a1			;y pos additive
	movk	2,a11			;x pos additive
	movi	-2,a12
nxtd11
	cmpi	ALLEYOOP12_SEQ,a14	;only angle 3, <5 dnk rating
	jrne	nxtd12
	movi	-17,a1			;y pos additive
	movi	-15,a11			;x pos additive
	movi	15,a12
nxtd12
	cmpi	ALLEYOOP13_SEQ,a14	;only angle 4, <5 dnk rating
	jrne	nxtd13
	movi	-26,a1			;y pos additive
	movk	5,a11			;x pos additive
	movi	-5,a12
nxtd13
	cmpi	ALLEYOOP14_SEQ,a14	;only angle 5, <5 dnk rating
	jrne	drevs
	movi	-34,a1			;y pos additive
	movk	1,a11			;x pos additive
	movi	-1,a12
drevs
	sll	16,a1
	add	a1,a10
	move	*a6(plyr_anirevff),a1
	jrnz	nooff
	move	a12,a11

nooff
	move	*a0(OXPOS),a1
	move	*a0(OXANI+16),a14
	add	a14,a1
	sub	a1,a3			;X delta
	move	*a0(OZPOS),a1
	sub	a1,a5			;Y delta

	move	*a6(plyr_jmpcnt),a14
	jrz	nolead			;In jump?
	add	a11,a3

nolead
	sll	16,a3
	sll	16,a5
	divs	a4,a3
	divs	a4,a5

	move	a3,*a0(OXVEL),L
	move	a5,*a0(OZVEL),L

	move	*a0(OYVAL),a3,L		;get balls Y
	sub	a10,a3			;a3=delta Y

	sra	2,a10
	add	a10,a3

	move	a4,a5
	move	*a6(plyr_nojoy),a2
	jrn	nopoh			;Leading pass?

	subk	4,a5			;leading pass, get there a faster...
nopoh
	movi	-GRAVB/2,a1
	move	*a13(plyr_jmpcnt),a2
	jrnz	level			;In jump?

	move	*a6(plyr_jmpcnt),a2
	jrnz	level			;In jump? No bounce pass


	move	*a13(plyr_tmdist),a14
	cmpi	130*DIST_REDUCTION,a14
	jrlt	level



	move	@PCNT,a14
	andi	0fh,a14
	jrnz	level

	move	*a8(OIMG),a14,L
	.ref	T4DESPA5
	cmpi	T4DESPA5,a14
	jrz	level

	move	*a13(plyr_seq),a14	;0CHhk for overhead pass
	cmpi	PASSNEWOH_SEQ,a14
	jrz	level
	cmpi	PASSNL_SEQ,a14
	jrz	level
	move	*a13(plyr_seqdir),a14
	cmpi	0,a14
	jrz	level
	cmpi	1,a14
	jrz	level
	cmpi	7,a14
	jrz	level

	move	*a0(OYVAL),a3,L		;Adjust for hgt difference
	movi	-GRAVB/2,a1
	srl	1,a4
level
	mpys	a4,a1
	divs	a4,a3
	sub	a3,a1
	move	a1,*a0(OYVEL),L

	move	*a13(plyr_num),a0
	move	a0,@ballpnumshot
	move	a0,@ballpnumlast
	move	a0,@ballsclastp

	movi	-1,a0
	move	a0,@ballpnum		;No owner
	clr	a0
	move	a0,@ballscorezhit
	move	a0,@ballpasstime
	move	a0,*a13(plyr_ownball)
	move	a0,*a6(plyr_shtdly)	;Tell teammate he can catch ball!!
	movk	30,a0
	move	a0,*a13(plyr_shtdly)

	addk	5,a5
	move	a5,*a6(plyr_rcvpass)	;Tell teammate when to expect pass


	movi	pass_snd,a0,L
	move	*a6(plyr_seqflgs),a14		;is teammate in dunk ?
	btst	DUNK_B,a14
	jrz	rpas
	movi	aly_pass_snd,a0,L		;passing to alley-opper
rpas	move	@plyr_onfire,a14
	move	*a13(plyr_num),a5
	btst	a5,a14
	jrz	npas			;br=plyr not on fire
	movi	fpass_snd,a0,L
npas	calla	snd_play1



plyr_pass_x	PULL	a6,a9,a10,a11,a12
	rets


longpas_t
	.word	103,101,99,97,95,93
	.word	91,89,87,85,83
shortpas_t
	.word	127,124,121,118,115,112
	.word	109,106,103,100,97
turbopas_t
	.word	28,29,30,31,32,33
	.word	35,38,41,44,44



RTIME	.equ	25

 SUBRP	plyr_tryrebound

	PUSH	a6,a7

	move	@plyrinautorbnd,a1
	jrnz	plyr_tryrebound_x			;Someone else doing?

	move	@game_time,a14,L
	cmpi	0500H,a14
	jrge	heave_b			;Do it
	
	move	*a13(plyr_num),a0
	move	@ballpnumshot,a1
	cmp	    a0,a1
	jrz	    plyr_tryrebound_x
	XORI	1,a1
	cmp	    a1,a0
	jrz	    plyr_tryrebound_x			;Br=teammate shot

heave_b
					;0CHhk my start
	move	*a8(OZPOS),a1		;Get SZ
	subi	CZMID,a1
	abs	a1
	cmpi	40,a1
	jrgt	posok
	move	*a8(OXPOS),a0		;Get SX
	move	*a8(OXANI+16),a14
	add	a14,a0
	subi	WRLDMID,a0
	abs	a0
	cmpi	HOOPRX-WRLDMID+13,a0
	jrge	plyr_tryrebound_x			;Under backboard?

	subk	12,a1
	jrgt	posok
	cmpi	HOOPRX-WRLDMID-8,a3
	jrge	plyr_tryrebound_x			;Under rim?


posok
	move	@ballobj_p,a5,L


	movk	RTIME,a0		;0FHind new Y pos in x ticks
	move	*a5(OYVAL),a4,L
	move	*a5(OYVEL),a2,L
	movi	GRAVB,a1
newblp
	add	a2,a4
	add	a1,a2
	dsj	a0,newblp

	sra	16,a4

	cmpi	-140,a4
	jrlt	plyr_tryrebound_x			;Too hi?

	addk	30,a4
	move	*a8(OYPOS),a0
	cmp	a0,a4
	jrge	plyr_tryrebound_x			;Ball lower than plyr?



	move	*a5(OXVAL),a6,L		;0FHind new XZ pos in x ticks
	move	*a5(OXANI),a14,L
	add	a14,a6
	move	*a5(OZVAL),a7,L

	move	a6,a0			;0CHhk ball pos
	move	a7,a1
	sra	16,a0
	sra	16,a1

	subi	CZMID,a1
	abs	a1
	subk	12,a1
	jrgt	bposok
	subi	WRLDMID,a0
	abs	a0
	cmpi	HOOPRX-WRLDMID-10,a3
	jrge	plyr_tryrebound_x			;Under rim or backboard?
bposok

	movk	RTIME,a0
	move	*a5(OXVEL),a1,L
	mpys	a0,a1
	add	a1,a6
	move	*a5(OZVEL),a1,L
	mpys	a0,a1
	add	a1,a7

	sra	16,a6
	sra	16,a7

	move	a6,a0			;0CHhk my destination
	move	a7,a1

	subi	CZMID,a1
	abs	a1
	cmpi	40,a1
	jrgt	eposok
	subi	WRLDMID,a0
	abs	a0
	cmpi	HOOPRX-WRLDMID+13,a0
	jrge	plyr_tryrebound_x			;Under backboard?
	subk	14,a1
	jrgt	eposok
	cmpi	HOOPRX-WRLDMID-10,a3
	jrge	plyr_tryrebound_x			;Under rim?
eposok

	move	*a13(plyr_num),a14
	sll	5,a14
	addi	player_data,a14,L
	move	*a14,a14,L
	move	*a14(PR_PRIVILEGES),a14
	jrle	eposok2       			;br=not a created player
	btst	5,a0				;SUPER AUTO-REBOUND privilege?
	jrz	eposok2			;br=no

	callr	seekdirdist_obxz128
	cmpi	70,a1				;close enough to jump?
	jrlt	eposok3			;br=yes
	jruc	plyr_tryrebound_x
eposok2
	callr	seekdirdist_obxz128
	cmpi	60,a1
	jrge	plyr_tryrebound_x			;Too far to jump?

eposok3
	move	a0,*a13(plyr_newdir)	;Turn where ball is headed

	movk	REBOUNDA_SEQ,a0
	move	a0,@plyrinautorbnd

	move	*a13(plyr_dir),a7
	callr	plyr_setseq


plyr_tryrebound_x	PULL	a6,a7
	rets



 SUBR	clr_autorbnd

	clr	a0
	move	a0,@plyrinautorbnd
	rets



 SUBRP	plyr_setballxyz
	move	@ballobj_p,a0,L

	move	*a8(OZPOS),a1		;>Set Z
	move	*a13(plyr_ballzo),a14
	add	a14,a1
	move	a1,*a0(OZPOS)

	move	*a8(OXVAL),a1,L		;>Set X
	move	a1,b0
	move	*a13(plyr_ballxo),a14,L
	add	a14,a1
	move	*a0(OIMG),a14,L
	move	*a14(IANIOFFX),a14
	sll	16,a14
	sub	a14,a1
	move	a1,*a0(OXVAL),L

	move	*a8(OXANI),a14,L	;Make 3D ball X+ani = plyr X+ani
	sub	a14,a1
	move	b0,a14
	sub	a1,a14
	move	a14,*a0(OXANI),L

	move	*a13(plyr_ballyo),a1
	cmpi	-200,a1
	jreq	bfree			;Ball Y free?

	move	*a0(OIMG),a14,L		;>Set Y
	move	*a14(IANIOFFY),a14
	sub	a14,a1
	move	*a8(OYPOS),a14
	add	a14,a1
	move	a1,*a0(OYPOS)
	clr	a1
	move	a1,*a0(OYVEL),L		;Stop grav from accumulating
	move	a1,*a0(OXVEL),L
	move	a1,*a0(OZVEL),L
	move	a1,@ballfree		;!Free

	rets

bfree
	move	@ballfree,a14
	jrnz	plyr_setballxyz_x			;Already free?
	movk	1,a14
	move	a14,@ballfree		;Free
	move	*a0(OYPOS),a1
	move	*a0(OIMG),a14,L
	move	*a14(IANIOFFY),a14
	add	a14,a1
	movi	-0a00H,a14		;Push it towards gnd
	mpys	a14,a1
	addi	016000H,a1
	move	a1,*a0(OYVEL),L
plyr_setballxyz_x	rets



 SUBR	anipt_getsclxy

	move	a2,b0

	move	*a8(ODATA_p),a0,L
	move	*a8(OIMG),a2,L

	move	*a8(OZPOS),a14
	subi	GZBASE,a14
	jrge	zok1
	clr	a14
zok1	srl	4,a14			;/16
	sll	6,a14			;*64
	add	a14,a0
	addk	32,a0

	move	*a0+,a14
	sll	4,a14			;*16
	move	*a2(IANIOFFX),a1
	mpys	a14,a1

	move	*a0,a14
	sll	4,a14			;*16
	move	a1,a0
	move	*a2(IANIOFFY),a1
	mpys	a14,a1

	move	*a8(OCTRL),a14
	btst	B_FLIPH,a14
	jrz	    anipt_getsclxy_x			;No flip?

	move	*a2,a2			;ISIZEX
	subk	1,a2
	sll	16,a2			;*64K
	neg	a0
	add	a2,a0			;+size

anipt_getsclxy_x	move	b0,a2
	rets



 SUBR	anipt2_getsclxy

	move	a2,b0

	move	*a8(ODATA_p),a0,L
	move	*a8(OIMG),a2,L

	move	*a8(OZPOS),a14
	subi	GZBASE,a14
	jrge	zok2
	clr	    a14
zok2	
    srl	    4,a14			;/16
	sll	    6,a14			;*64
	add	    a14,a0
	addk	32,a0

	move	*a0+,a14
	sll	    4,a14			;*16
	move	*a2(IANI2X),a1
	mpys	a14,a1

	move	*a0,a14
	sll	    4,a14			;*16
	move	a1,a0
	move	*a2(IANI2Y),a1
	cmpi	-200,a1			;stupid K!!! alert!!!
	jrne	ynorm
	sll	    16,a1
	jruc	cflip
ynorm	
    mpys	a14,a1

cflip	
    move	*a8(OCTRL),a14
	btst	B_FLIPH,a14
	jrz	    anipt2_getsclxy_x			;No flip?

	move	*a2,a2			;ISIZEX
	subk	1,a2
	sll	    16,a2			;*64K
	neg	    a0
	add	    a2,a0			;+size

anipt2_getsclxy_x	
    move	b0,a2
	rets



 SUBR	anipt3_getsclxy

	move	a2,b0

	move	*a8(ODATA_p),a0,L
	move	*a8(OIMG),a2,L

	move	*a8(OZPOS),a14
	subi	GZBASE,a14
	jrge	zok3
	clr	a14
zok3	srl	4,a14			;/16
	sll	6,a14			;*64
	addk	32,a0
	add	a14,a0

	move	*a0+,a14
	sll	4,a14			;*16
	move	*a2(IANI3X),a1
	mpys	a14,a1

	move	*a0,a14
	sll	4,a14			;*16
	move	a1,a0
	move	*a2(IANI3Y),a1
	mpys	a14,a1

	move	*a8(OCTRL),a14
	btst	B_FLIPH,a14
	jrz	    anipt3_getsclxy_x			;No flip?

	move	*a2,a2			;ISIZEX
	subk	1,a2
	sll	16,a2			;*64K
	neg	a0
	add	a2,a0			;+size

anipt3_getsclxy_x	
    move	b0,a2
	rets



 SUBRP	plyr_setshadow

	move	*a13(plyr_shadobj_p),a4,L

	move	*a8(OZPOS),a0
	move	a0,a1
	subi	50,a1			;Adjust
	move	a1,*a4(OZPOS)

	subi	CZMIN,a0		;-Base
	jrge	zok4
	clr	a0
zok4	srl	5,a0			;/32
	move	*a8(OYPOS),a1
	move	*a13(plyr_aniy),a14
	add	a14,a1			;Ani pt position
	sra	4,a1			;/16 (Neg)
	add	a1,a0

	addk	(ani_t-sani_t)/32,a0
	jrnn	pss_0
	clr	a0
pss_0
	movk	(bani_t-sani_t)/32-1,a14
	cmp	a0,a14
	jrge	pss_1
	move	a14,a0
pss_1
	move	@pup_baby,a14		;Plyr babies? No if 0
	jrz	pss_2
	addk	(bani_t-sani_t)/32,a0
pss_2
	sll	5,a0			;*32
	addi	sani_t,a0

	move	*a0,a2,L
	move	a2,*a4(OIMG),L		;Set new img
	move	*a2,a14,L
	move	a14,*a4(OSIZE),L
	move	*a2(ISAG),*a4(OSAG),L

	callr	anipt_getsclxy

	move	*a2(IANIOFFX),a3
	sll	16,a3
	move	a3,*a4(OXANI),L

	move	*a8(OXVAL),a14,L
	add	a0,a14			;Ani X
	sub	a3,a14
	move	a14,*a4(OXVAL),L

	move	*a2(IANIOFFY),a3
	neg	a3
	move	a3,*a4(OYPOS)

	rets


sani_t
	.long	shadow15,shadow15,shadow15,shadow15
	.long	shadow15,shadow15,shadow15,shadow15
	.long	shadow15,shadow14,shadow13,shadow12
ani_t	.long	shadow11,shadow10,shadow9,shadow8
	.long	shadow7,shadow6,shadow5,shadow4
	.long	shadow3,shadow2,shadow1,shadow1
	.long	shadow1,shadow1,shadow1

bani_t
	.long	ballshad7,ballshad7,ballshad7,ballshad7
	.long	ballshad7,ballshad7,ballshad7,ballshad7
	.long	ballshad7,ballshad5,ballshad4,ballshad2
	.long	shadow18,shadow18,shadow17,shadow17
	.long	shadow16,shadow16,shadow15,shadow15
	.long	shadow14,shadow14,shadow13,shadow13
	.long	shadow12,shadow12,shadow11



 SUBR	plyr_headalign

	move	*a13(plyr_headobj_p),a6,L ;0A6H=*Head obj

 SUBR	plyr_headalign2

	move	*a8(OIMG),a0,L		;>Set Z
	move	*a8(OZPOS),a14
	move	*a0(IANI3Z),a1
	add	a1,a14
	move	a14,*a6(OZPOS)
	sub	a1,a14
	neg	a1
	move	a1,*a6(OMISC)		;Z offset

					;0CaHlc head scale anixy (A3,A5)
	subi	GZBASE,a14		;-Base
	jrge	zok5
	clr	a14
zok5	srl	4,a14			;/16
	sll	6,a14			;*64
	move	*a6(ODATA_p),a0,L
	addk	32,a0
	add	a14,a0

	move	*a0+,a14
	sll	4,a14			;*16
	move	*a6(OIMG),a2,L

	move	*a2(IANIOFFX),a3
	mpys	a14,a3

	move	*a0,a14
	sll	4,a14			;*16

	move	*a2(IANIOFFY),a5
	mpys	a14,a5

	move	*a6(OCTRL),a14
	btst	B_FLIPH,a14
	jrz	nohf2			;No flip?

	move	*a2,a2			;ISIZEX
	subk	1,a2
	sll	16,a2			;*64K
	neg	a3
	add	a2,a3			;+size
nohf2

	callr	anipt3_getsclxy

	move	*a8(OYVAL),a14,L
	add	a1,a14			;Ani3 Y
	sub	a5,a14
	move	a14,*a6(OYVAL),L

	move	*a8(OXVAL),a14,L
	move	a14,a1
	add	a0,a14			;Ani3 X
	sub	a3,a14
	move	a14,*a6(OXVAL),L

	move	*a8(OXANI),a0,L		;Make head X+ani = plyr X+ani
	add	a0,a1
	sub	a14,a1
	move	a1,*a6(OXANI),L

	rets






 SUBRP	plyr_referee


	.asg	12,REFCTR_OX		;Ref Xoff so toss to be centered


	clr	a0
	move	a0,@ditch_meter

	.if	DEBUG
	move	@QUICK_TIP,a0
	jrnz	skipq3
	.endif

	clr	a9
	movk	1,a11
	CREATE	METER_PID,jumpball_meter
	movk	1,a9
	movk	2,a11
	CREATE	METER_PID,jumpball_meter
	.ref	jumpball_meter
	.if	DEBUG
skipq3
	.endif

	movk	1,a0
	callr	plyr_setac

	movi	[WRLDMID+REFCTR_OX,0],a0
	clr	a1
	movi	shadow7,a2
	movi	CZMID-30-1,a3
	movi	DMAWNZ|M_3D|M_SHAD|M_NOCOLL,a4
	movi	CLSDEAD,a5
	clr	a6
	clr	a7
	calla	BEGINOBJ2
	move	a8,a11			;A11=ref shadow *obj

	movi	[WRLDMID+REFCTR_OX,0],a0
	clr	a1
	movi	REFWHS1,a2
	movi	CZMID-30,a3
	movi	DMAWNZ|M_3D|M_NOCOLL,a4
	calla	BEGINOBJ2

	movi	att_t,a0,L
	move	a0,*a13(plyr_attrib_p),L
	move	*a0,a0,L
	move	a0,*a8(ODATA_p),L

	SLEEPK	5

	movk	1,a0
	move	a0,*a13(plyr_ownball)		;!0=Ref has ball

	movk	25,a0
	move	a0,*a13(plyr_ballzo)

	movi	ani_l,a9
	.if	DEBUG
	move	@QUICK_TIP,a14
	jrz	skipq2
	movi	ani_l_quick_tip,a9
skipq2
	.endif
	movk	1,a10
ani_lp
	dsj	a10,noani2

getwt	move	*a9+,a10
	jrz	refdone
	jrnn	nocode
	
	move	*a9+,a0,L			;Call function
	call	a0
	jruc	getwt
nocode
	move	*a9+,a0,L
	movk	M_WRNONZ,a1
	callr	plyr_ani

	callr	anipt2_getsclxy
	move	a0,*a13(plyr_ballxo),L
	sra	16,a1
	move	a1,*a13(plyr_ballyo)

	move	*a13(plyr_aniy),a1
	neg	a1
	move	a1,*a8(OYPOS)			;Set on gnd

noani2
	move	*a13(plyr_ownball),a0
	jrz	noball				;Tossed up?

	callr	plyr_setballxyz
noball
	callr	joy_read2			;Scan buttons since ac is on

	clr	a0
	move	a0,@P1CTRL
	move	a0,@P4CTRL

	movi	P1CTRL,a1			;>Kill unwanted bits
	movk	4,b0
jlp	move	*a1,a0
	andi	BUT1_M<<8+BUT1_M,a0
	move	a0,*a1+
	dsj	b0,jlp

	SLEEPK	1
	move	@HALT,a0
	jrnz	noball
	jruc	ani_lp

refdone
	SLEEPK	5
	calla	SCRTST
	jrz	refdone			;Still on screen?
	move	a11,a0
	calla	DELOBJ
	jauc	DELOBJDIE


att_t	.long	scale66_t,REF_P

	.if	DEBUG
ani_l_quick_tip
	WL	-1,tossball
	WL	-1,step_back
	WL	-1,ac_off
	W0
	.endif

ani_l

	WL	TSEC,REFWHS1
	WL	4,REFWHS2
	WL	4,REFWHS3
	WL	4,REFWHS4
	WL	4,REFWHS5
	WL	4,REFWHS6
	WL	4,REFWHS7
	WL	4,REFWHS8
	WL	-1,do_whstle
	WL	15,REFWHS9
	WL	4,REFWHS8
	WL	4,REFWHS7
	WL	4,REFWHS6
	WL	4,REFWHS5
	WL	4,REFWHS4
	WL	4,REFWHS3
	WL	4,REFWHS2
	WL	4,REFWHS1

	WL	3,REFTOS1
	WL	3,REFTOS2
	WL	3,REFTOS3
	WL	3,REFTOS4
	WL	3,REFTOS5
	WL	3,REFTOS6
	WL	3,REFTOS7
	WL	3,REFTOS8
	WL	3,REFTOS9
	WL	3,REFTOS10
	WL	3,REFTOS11
	WL	3,REFTOS12
	WL	3,REFTOS13

	WL	-1,tossball	;109 TICKS


	WL	3,REFTOS14
	WL	4,REFTOS15
	WL	-1,start_jumps
	WL	3,REFTOS16
	WL	3,REFTOS17
	WL	3,REFTOS18
	WL	3,REFTOS19
	WL	-1,step_back


	WL	3,REFRUN1
	WL	3,REFRUN2
	WL	3,REFRUN3
	WL	3,REFRUN4
	WL	3,REFRUN5
	WL	3,REFRUN6
	WL	3,REFRUN7
	WL	3,REFRUN8
	WL	3,REFRUN9
	WL	3,REFRUN10
	WL	3,REFRUN11
	WL	3,REFRUN1
	WL	3,REFRUN2
	WL	3,REFRUN3
	WL	3,REFRUN4
	WL	3,REFRUN5
	WL	3,REFRUN6
	WL	3,REFRUN7
	WL	3,REFRUN8
	WL	3,REFRUN9
	WL	3,REFRUN10
	WL	3,REFRUN11
	WL	-1,ac_off	;85 AFTER TOSS
	WL	-1,tip_off_spch
	WL	3,REFRUN1
	WL	3,REFRUN1
	WL	3,REFRUN2
	WL	3,REFRUN3
	WL	3,REFRUN4
	WL	3,REFRUN5
	WL	3,REFRUN6
	WL	3,REFRUN7
	WL	3,REFRUN8
	WL	3,REFRUN9
	WL	3,REFRUN10
	WL	3,REFRUN11
	WL	3,REFRUN1
	WL	3,REFRUN2
	WL	3,REFRUN3
	WL	3,REFRUN4
	WL	3,REFRUN5
	WL	2,REFRUN6
	WL	-1,stop_back
	WL	4,REFSTN1
	WL	4,REFSTN2
	WL	4,REFSTN4
	W0

tip_off_spch
	.ref	tip_off_speech
	CREATE0	tip_off_speech
	rets

do_whstle
	movi	whitsle_snd,a0
	jauc	snd_play1


tossball
	move	@ballobj_p,a1,L
	movi	0fffa4800H,a0
	clr	a2

	.if	DEBUG
	move	@QUICK_TIP,a14
	jrz	normqa
	movi	-GRAVB,a0
	movk	3,a2
normqa
	.endif

	move	a0,*a1(OYVEL),L
	clr	a0
	move	a0,@clock_active		;Turn on clock

	move	a2,*a13(plyr_ownball)		;Let go
	rets


step_back
	movi	-11800h,a0			;-14000h
	move	a0,*a8(OZVEL),L
	move	a0,*a11(OZVEL),L

	rets

start_jumps

	move	a11,a2

	move	@plyrproc_t+32,a11,L
	CREATE	TIPID,plyr_tip

	move	@plyrproc_t+32*2,a11,L
	CREATE	TIPID,plyr_tip

  
	move	a2,a11

	rets

ac_off
	clr	a0
	jruc	plyr_setac


stop_back
	clr	a0
	move	a0,*a8(OZVEL),L
	move	a0,*a11(OZVEL),L
	rets



	.bss	t1bcnt	,16	;Team1 (p1)  button hits
	.bss	t2bcnt	,16	;Team2 (p2) ^

 SUBRP	plyr_tip

	move	*a11(PA8),a8,L

	PUSH	a13
	move	a11,a13

	movi	TIPJ_SEQ,a0
	move	*a13(plyr_dir),a7
	callr	plyr_setseq
	move	a10,*a13(PA10),L

	PULL	a13



	.if	DEBUG
	move	@QUICK_TIP,a14
	jrz	normq
	SLEEPK	6
	clr	a0
	jruc	conte
normq
	.endif

	SLEEPK	15
	movi	-GRAVB*30-4000h,a0
conte
	move	a0,*a8(OYVEL),L


	movi	8800h,a0
	move	*a8(OCTRL),a14
	btst	B_FLIPH,a14
	jrz	    normnf			;No flip?
	neg	    a0
normnf
	move	a0,*a8(OXVEL),L


	movk	1,a0			;Start jump
	move	a0,*a11(plyr_jmpcnt)

	movi	t1bcnt,a9		;0CHount button1 down presses
	move	*a11(plyr_num),a1
	btst	1,a1
	jrz	    t1c
	addk	16,a9
t1c	
    clr	a0
	move	@PSTATUS2,a14
	btst	a1,a14
	jrnz	human2			;Human opponent?
	movk	3,a0			;Drones  presses
human2
   	move	a0,*a9

	.if	DEBUG
	move	@QUICK_TIP,a14
	jrnz	skipq4
	.endif
	SLEEPK	25
skipq4

	move	@plyrobj_t+32,a0,L
	movi	-2800h,a14
	move	a14,*a0(OXVEL),L



	move	@plyrobj_t+64,a0,L

	movi	2800h,a14
	move	a14,*a0(OXVEL),L


	move	*a11(plyr_num),a5

	move	@plyrproc_t+32,a0,L
	move	*a0(plyr_meter_time),a0
	move	@plyrproc_t+64,a1,L
	move	*a1(plyr_meter_time),a1


	btst	1,a5
	jrnz	tm1xx
	SWAP	a0,a1
tm1xx
	.if	DEBUG
	move	@QUICK_TIP,a14
	jrnz	contq
	.endif
	cmp	a1,a0
	jrlt	plyr_tip_x			;Less presses than opponent?
	jrne	contq
	.ref	meter_maxxed
	move	@meter_maxxed,a0
	jrnz	shitpile
	move	@HCOUNT,a0
	andi	1,a0
	addk	1,a0
	move	a0,@meter_maxxed
shitpile
	cmp	a0,a5
	jrne	plyr_tip_x
contq
	movi	0fffea000H,a0
	movi	0ffff1000H,a1
  	movi	-9,a3
	btst	1,a5
	jrz	tm1a

	neg	a0
	neg	a1
	neg	a3
tm1a
	move	@ballobj_p,a2,L

	move	*a2(OXPOS),a4
	add	a3,a4
	move	a4,*a2(OXPOS)
	move	a0,*a2(OXVEL),L
	move	a1,*a2(OZVEL),L

	movi	-GRAVB*10,a0
	move	a0,*a2(OYVEL),L

	movi	TIPID,a0
	calla	KIL1C
	
	movk	1,a0
	.ref	ditch_meter
	move	a0,@ditch_meter

plyr_tip_x

	SOUND1	swat_snd

	DIE



 SUBR	plyr_endofqrtr

	movi	1000,a0
	move	a0,@cntrs_delay		;Delay credit timers

	.ref	firstbskt,t1ispro,t2ispro
	move	@gmqrtr,a0		;Next quarter
	addk	1,a0
	subk	7,a0
	jrn	qcap
	clr	a0
qcap
	addk	7,a0
	move	a0,@gmqrtr
	subk	1,a0
	jrne	not1st

	movi	AUD_1STQUARTR,a0	;01Hst guarter
	calla	AUD1

	JSRP	plyr_endqfinishshot

	clr	a0
	move	a0,@kp_qscrs,L
	move	a0,@kp_qscrs+32,L
	move	a0,@kp_qscrs+64,L
	move	a0,@kp_qscrs+96,L
	move	a0,@kp_qscrs+128,L	;overtime 1
	move	a0,@kp_qscrs+160,L	;overtime 2
	move	a0,@kp_qscrs+192,L	;overtime 3
	move	@scores,a0
	move	a0,@kp_qscrs
	move	@scores+16,a0
	move	a0,@kp_qscrs+16

	.ref	tuneq1_snd
	.ref	tuneq1ed_snd
	.ref	crwdbed_kill
	move	@pup_nomusic,a14
	jrz	play1
	SOUND1	tuneq1_snd
play1
	SOUND1	tuneq1ed_snd
	SOUND1	crwdbed_kill

	JSRP	hint_page
	jruc	tob

delay_spch
	SLEEP	90
	.ref	at_hlftme_sp
	SOUND1	at_hlftme_sp
	DIE

not1st
	subk	1,a0
	jrne	nothalf

	movi	AUD_HALFTIME,a0		;02Hnd quarter
	calla	AUD1

	JSRP	plyr_endqfinishshot

	move	@scores,a0
	move	@kp_qscrs,a14
	sub	a14,a0
	move	a0,@kp_qscrs+32
	move	@scores+16,a0
	move	@kp_qscrs+16,a14
	sub	a14,a0
	move	a0,@kp_qscrs+48

	CREATE0	delay_spch

	.ref	tuneq2_snd
	.ref	tuneq2ed_snd
	move	@pup_nomusic,a14
	jrz	play2
	SOUND1	tuneq2_snd
play2
	SOUND1	tuneq2ed_snd
	SOUND1	crwdbed_kill
	JSRP	halftime_showclips


	clr	a0
	JSRP	stats_page2

	movi	t1dunkcnt,a2		;>Setup most dunking team for board shatter
	move	*a2,a1
	cmpi	3,a1
	jrlt	nobrk			;!Enough dunks?
	subk	2,a1
	neg	a1
	move	a1,*a2			;New cnt
nobrk
	movi	t1dunkcnt+16,a2		;>Setup most dunking team for board shatter
	move	*a2,a1
	cmpi	3,a1
	jrlt	nobrk2			;!Enough dunks?
	subk	2,a1
	neg	a1
	move	a1,*a2			;New cnt
nobrk2


	move	@plyrproc_t,a8,L
	move	*a8(plyr_headobj_p),a0,L
	calla	DELOBJ
	move	*a8(plyr_shadobj_p),a0,L
	calla	DELOBJ
	move	a8,a0
	calla	KILL

	move	@plyrproc_t+32,a8,L
	move	*a8(plyr_headobj_p),a0,L
	calla	DELOBJ
	move	*a8(plyr_shadobj_p),a0,L
	calla	DELOBJ
	move	a8,a0
	calla	KILL

	move	@plyrproc_t+64,a8,L
	move	*a8(plyr_headobj_p),a0,L
	calla	DELOBJ
	move	*a8(plyr_shadobj_p),a0,L
	calla	DELOBJ
	move	a8,a0
	calla	KILL

	move	@plyrproc_t+96,a8,L
	move	*a8(plyr_headobj_p),a0,L
	calla	DELOBJ
	move	*a8(plyr_shadobj_p),a0,L
	calla	DELOBJ
	move	a8,a0
	calla	KILL


	.if DRONES_2MORE
	move	@plyrproc_t+128,a8,L
	move	*a8(plyr_headobj_p),a0,L
	calla	DELOBJ
	move	*a8(plyr_shadobj_p),a0,L
	calla	DELOBJ
	move	a8,a0
	calla	KILL
	move	@plyrproc_t+160,a8,L
	move	*a8(plyr_headobj_p),a0,L
	calla	DELOBJ
	move	*a8(plyr_shadobj_p),a0,L
	calla	DELOBJ
	move	a8,a0
	calla	KILL
	.endif


	move	@plyrobj_t,a0,L
	calla	DELOBJ
	move	@plyrobj_t+32,a0,L
	calla	DELOBJ
	move	@plyrobj_t+64,a0,L
	calla	DELOBJ
	move	@plyrobj_t+96,a0,L
	calla	DELOBJ


	.if DRONES_2MORE
	move	@plyrobj_t+128,a0,L
	calla	DELOBJ
	move	@plyrobj_t+160,a0,L
	calla	DELOBJ
	.endif


	movi	P1_PID,a0
	calla	KIL1C
	movi	P2_PID,a0
	calla	KIL1C
	movi	P3_PID,a0
	calla	KIL1C
	movi	P4_PID,a0
	calla	KIL1C


	.if DRONES_2MORE
	movi	P5_PID,a0
	calla	KIL1C
	movi	P6_PID,a0
	calla	KIL1C
	.endif


	movi	P1_PID,a0
	calla	obj_del1c
	movi	P2_PID,a0
	calla	obj_del1c
	movi	P3_PID,a0
	calla	obj_del1c
	movi	P4_PID,a0
	calla	obj_del1c


	.if DRONES_2MORE
	movi	P5_PID,a0
	calla	obj_del1c
	movi	P6_PID,a0
	calla	obj_del1c
	.endif

	CREATE0	doplyrs

	calla	pal_clean

	clr	a0
	move	a0,@plyr_main_initdone
	move	a0,@DISPLAYON

 
	movi	ARWPID,a0
	calla	KIL1C
	movi	arwid,a0
	calla	obj_del1c
	movi	ARWPID,a0
	calla	obj_del1c

	CREATE0	delay_arws



plyrwt
	SLEEPK	1
	move	@plyr_main_initdone,a0	;Wait for plyrs to init
	jrz	plyrwt

	SLEEPK	1

	PUSH	a8,a13

	move	@plyrproc_t,a13,L
	move	@plyrobj_t,a8,L
	move	*a8(OIMG),a2,L			;>Set new head img
	move	*a2(IANI3ID),a1
	sll	5,a1				;*32
	move	*a2(IANI3Z),a14
	neg	a14

	move	*a13(plyr_attrib_p),a0,L
	move	*a0(PAT_HEADT_p),a0,L
	add	a1,a0
	move	*a0,a4,L

	move	*a13(plyr_headobj_p),a3,L
	move	a14,*a3(OMISC)
	move	a4,*a3(OIMG),L			;Set new img
	move	*a4,a14,L
	move	a14,*a3(OSIZE),L
	move	*a4(ISAG),*a3(OSAG),L

	setf	1,0,0
	move	*a8(OCTRL+4),*a3(OCTRL+4)	;Copy HFlip bit
	move	*a2(IFLAGS+FLIPH_IFB),a14	;Chk reverse bit
	jrz	nohflip1
	move	*a3(OCTRL+4),a14		;Reverse hflip
	addk	1,a14
	move	a14,*a3(OCTRL+4)
nohflip1
	setf	16,1,0

	move	@plyrproc_t+32,a13,L
	move	@plyrobj_t+32,a8,L
	move	*a8(OIMG),a2,L			;>Set new head img
	move	*a2(IANI3ID),a1
	sll	5,a1				;*32
	move	*a2(IANI3Z),a14
	neg	a14

	move	*a13(plyr_attrib_p),a0,L
	move	*a0(PAT_HEADT_p),a0,L
	add	a1,a0
	move	*a0,a4,L

	move	*a13(plyr_headobj_p),a3,L
	move	a14,*a3(OMISC)
	move	a4,*a3(OIMG),L			;Set new img
	move	*a4,a14,L
	move	a14,*a3(OSIZE),L
	move	*a4(ISAG),*a3(OSAG),L

	setf	1,0,0
	move	*a8(OCTRL+4),*a3(OCTRL+4)	;Copy HFlip bit
	move	*a2(IFLAGS+FLIPH_IFB),a14	;Chk reverse bit
	jrz	nohflip2
	move	*a3(OCTRL+4),a14		;Reverse hflip
	addk	1,a14
	move	a14,*a3(OCTRL+4)
nohflip2
	setf	16,1,0

	PULL	a8,a13

	movk	1,a0
	move	a0,@DISPLAYON
	jruc	tob


delay_arws
	SLEEPK	10			;Give players a chance to start

 	.ref	start_arws
	calla	start_arws

	SLEEPK	8

 	clr	a0
	move	a0,@HALT

	DIE


doplyrs

	movi	plyrproc_t+32*NUMPLYRS,a2
	movi	plyrobj_t+32*(NUMPLYRS-1),a9
	movk	NUMPLYRS-1,a8
strtp2
	CREATE0	plyr_main
	move	a0,-*a2,L		;Save *proc
	subk	32,a9
	dsj	a8,strtp2

	move	a13,-*a2,L
	jruc	plyr_main		;0
	

nothalf
	subk	1,a0
	jrne	not3rd

	movi	AUD_3RDQUARTR,a0	;03Hrd quarter
	calla	AUD1

	JSRP	plyr_endqfinishshot

	move	@scores,a0
	move	@kp_qscrs,a14
	move	@kp_qscrs+32,a1
	add	a1,a14
	sub	a14,a0
	move	a0,@kp_qscrs+64
	move	@scores+16,a0
	move	@kp_qscrs+16,a14
	move	@kp_qscrs+48,a1
	add	a1,a14
	sub	a14,a0
	move	a0,@kp_qscrs+80

	.ref	tuneq3_snd
	.ref	tuneq3ed_snd
	move	@pup_nomusic,a14
	jrz	play3
	SOUND1	tuneq3_snd
play3
	SOUND1	tuneq3ed_snd
	SOUND1	crwdbed_kill

	JSRP	hint_page
	jruc	tob


not3rd


	subk	1,a0
	jrne	not4th

	movi	AUD_4THQUARTR,a0	;04Hth quarter
	calla	AUD1

	JSRP	plyr_endqfinishshot

	move	@scores,a0
	move	@kp_qscrs,a14
	move	@kp_qscrs+32,a1
	move	@kp_qscrs+64,a2
	add	a1,a14
	add	a2,a14
	sub	a14,a0
	move	a0,@kp_qscrs+96
	move	@scores+16,a0
	move	@kp_qscrs+16,a14
	move	@kp_qscrs+48,a1
	move	@kp_qscrs+80,a2
	add	a1,a14
	add	a2,a14
	sub	a14,a0
	move	a0,@kp_qscrs+112

	.ref	tuneq4_snd
	move	@pup_nomusic,a14
	jrz	play4
	SOUND1	tuneq4_snd
play4
 	move	@scores,a0
	move	@scores+16,a1
	cmp	a0,a1
	jreq	tie

endofg	callr	endgame_audits		;0EHnd of game

	.ref	tune_wingame
	SOUND1	tune_wingame
	SOUND1	crwdbed_kill

	SLEEP	TSEC*2

	.ref	victory_speech
	calla	victory_speech

	SLEEP	TSEC*2+30


	movk	1,a0
	JSRP	stats_page

	clr	a0
	move	a0,@IRQSKYE

	calla	display_blank
	calla	save_player_records
	.ref	update_team_stats_records
	calla	update_team_stats_records
	.ref	update_world_records
	calla	update_world_records
	calla	display_unblank

	JSRP	rank_screen

	JSRP	grand_champs_screen	;if a champ is found then



	clr	a0

	move	a0,@qtr_purchased,L	;clr 4x16
	move	a0,@qtr_purchased+20h,L

	move	@team1,a0
	move	a0,@kp_team1
	move	@team2,a0
	move	a0,@kp_team2
	move	@scores,a0,L
	move	a0,@kp_scores,L

	move	@kp_qscrs,a0,L
	move	a0,@kp_qscrs2,L
	move	@kp_qscrs+32,a0,L
	move	a0,@kp_qscrs2+32,L
	move	@kp_qscrs+64,a0,L
	move	a0,@kp_qscrs2+64,L
	move	@kp_qscrs+96,a0,L
	move	a0,@kp_qscrs2+96,L
	move	@kp_qscrs+128,a0,L
	move	a0,@kp_qscrs2+128,L
	move	@kp_qscrs+160,a0,L
	move	a0,@kp_qscrs2+160,L
	move	@kp_qscrs+192,a0,L
	move	a0,@kp_qscrs2+192,L

	JSRP	winner_stays_on

	jauc	game_over


not4th
	JSRP	plyr_endqfinishshot	;>Overtime

	move	@gmqrtr,a0
	subk	5,a0			;which overtime ?
	jrne	notot1			;br=not 1st

	move	@scores,a0
	move	@kp_qscrs,a14
	move	@kp_qscrs+32,a1
	move	@kp_qscrs+64,a2
	add	a1,a14
	add	a2,a14
	move	@kp_qscrs+96,a1
	add	a1,a14
	sub	a14,a0
	move	a0,@kp_qscrs+128
	move	@scores+16,a0
	move	@kp_qscrs+16,a14
	move	@kp_qscrs+48,a1
	move	@kp_qscrs+80,a2
	add	a1,a14
	add	a2,a14
	move	@kp_qscrs+112,a1
	add	a1,a14
	sub	a14,a0
	move	a0,@kp_qscrs+144
	jruc	otdne
notot1
	subk	1,a0
	jrne	notot2

	move	@scores,a0
	move	@kp_qscrs,a14
	move	@kp_qscrs+32,a1
	move	@kp_qscrs+64,a2
	add	a1,a14
	add	a2,a14
	move	@kp_qscrs+96,a1
	add	a1,a14
	move	@kp_qscrs+128,a1
	add	a1,a14
	sub	a14,a0
	move	a0,@kp_qscrs+160
	move	@scores+16,a0
	move	@kp_qscrs+16,a14
	move	@kp_qscrs+48,a1
	move	@kp_qscrs+80,a2
	add	a1,a14
	add	a2,a14
	move	@kp_qscrs+112,a1
	add	a1,a14
	move	@kp_qscrs+144,a1
	add	a1,a14
	sub	a14,a0
	move	a0,@kp_qscrs+176
	jruc	otdne
notot2
	subk	1,a0
	jrne	otdne

	move	@scores,a0
	move	@kp_qscrs,a14
	move	@kp_qscrs+32,a1
	move	@kp_qscrs+64,a2
	add	a1,a14
	add	a2,a14
	move	@kp_qscrs+96,a1
	add	a1,a14
	move	@kp_qscrs+128,a1
	add	a1,a14
	move	@kp_qscrs+160,a1
	add	a1,a14
	sub	a14,a0
	move	a0,@kp_qscrs+192
	move	@scores+16,a0
	move	@kp_qscrs+16,a14
	move	@kp_qscrs+48,a1
	move	@kp_qscrs+80,a2
	add	a1,a14
	add	a2,a14
	move	@kp_qscrs+112,a1
	add	a1,a14
	move	@kp_qscrs+144,a1
	add	a1,a14
	move	@kp_qscrs+176,a1
	add	a1,a14
	sub	a14,a0
	move	a0,@kp_qscrs+208

otdne
	.ref	tuneot_snd
	move	@pup_nomusic,a14
	jrz	play5
	SOUND1	tuneot_snd
play5
 	move	@scores,a0
	move	@scores+16,a1
	cmp	a0,a1
	jrne	endofg



tie					;>Tie
	movi	AUD_OVERTIME,a0
	calla	AUD1

	.ref	tuneoted_snd
	SOUND1	tuneoted_snd
	SOUND1	crwdbed_kill

	movk	1,a0
	move	a0,@HALT

	CREATE0	show_ot_msg

	SLEEP	120

	SOUND1	overtime_sp

	SLEEP	110

	movk	12,a1			;Free time into OT for
	movi	P1DATA,a2

	move	@game_purchased,a0
	movk	4,b0
	clr	a3

tlp	btst	a3,a0
	jrz	nx			;No full game?
	move	a1,*a2(ply_time)	;Give xtra time
nx	addi	PDSIZE,a2
	addk	1,a3
	dsj	b0,tlp

	move	b0,@game_purchased

	move	@team1,a0
	move	a0,@kp_team1
	move	@team2,a0
	move	a0,@kp_team2
	move	@scores,a0,L
	move	a0,@kp_scores,L

	JSRP	hint_page



tob
	move	@plyr_onfire,a0
	jrnz	nodrnfr
	move	@t1ispro,a0
	jrnz	chk2			; br=tm1 not champ level
	move	@PSTATUS2,a14
	andi	0CH,a14
	jrz	drnfr
chk2
	move	@t2ispro,a0
	jrnz	nodrnfr		; br=tm2 not champ level
	move	@PSTATUS2,a14
	andi	3,a14
	jrnz	nodrnfr
drnfr
	subk	1,a0
	move	a0,@firstbskt
nodrnfr

	CREATE0	test
	

	.ref	random_ads
	calla	random_ads

	calla	pal_clean
	movi	nofade_t,a10
	CREATE0	fade_up_half

	CREATE0	fix_floor



	move	@gmqrtr,a11
	sll	32-1,a11
	CREATE0	plyr_takeoutball2

	clr	a0
	move	a0,@cntrs_delay		;Delay credit timers
	move	@gmqrtr,a14
	cmpi	2,a14
	jrz	skp
	move	a0,@HALT
skp	clr	a0
	move	a0,@IRQSKYE

	move	@gmqrtr,a14
	cmpi	2,a14
	jrnz	skpz
	CREATE0	delay_numbs
	RETP



test
	movi	plyrproc_t,a9
	movk	4,a10
arrow_lp
	move	*a9+,a0,L
	move	*a0(plyr_lost_ptr),a2,L
	move	*a2(PA8),a0,L
	jrz	nxt
	clr	a14
	move	*a2(PA9),a1,L
	move	a14,*a1(OSCALE)
	movk	10,a14
	move	a14,*a2(PTIME)
	calla	DELOBJ
	clr	a0
	move	a0,*a2(PA8),L
nxt	dsj	a10,arrow_lp

	DIE

skpz
	movi	P1DATA,a10		;Turn on 's at start of qrtr
	calla	stick_number
	movi	P2DATA,a10
	calla	stick_number
	movi	P3DATA,a10
	calla	stick_number
	movi	P4DATA,a10
	calla	stick_number

	RETP

delay_numbs
	SLEEPK	20			;Turn on 's at start of 2nd half
	movi	P1DATA,a10
	calla	stick_number
	movi	P2DATA,a10
	calla	stick_number
	movi	P3DATA,a10
	calla	stick_number
	movi	P4DATA,a10
	calla	stick_number
	DIE

fix_floor
	SLEEPK	12
	.ref	fix_floorclr
	calla	fix_floorclr
	DIE


 SUBRP	endgame_audits



	movi	AUD_COMPLETED,a0	;04Hth quarter
	calla	AUD1

	move	@scores,a0
	move	@scores+10h,a1
	cmp	a1,a0
	jrhi	t1_wins
t2_wins
	movi	AUD_LOS_SCORE,a0
	move	@scores,a1
	calla	AUD

	movi	AUD_WIN_SCORE,a0
	move	@scores+10h,a1
	calla	AUD

	jruc	contf

t1_wins
	movi	AUD_WIN_SCORE,a0
	move	@scores,a1
	calla	AUD

	movi	AUD_LOS_SCORE,a0
	move	@scores+10h,a1
	calla	AUD
contf

	move	@PSTATUS2,a0
	andi	011b,a0
	jrnz	team1_human
	move	@scores,a4		;CPU SCORE
	move	@scores+10h,a5		;HUMAN SCORE

	movi	AUD_CPUGAMES,a0		;a cpu team
	calla	AUD1
	movi	AUD_CPUSCORES,a0
	move	a4,a1			;cpu score
	calla	AUD
	callr	do_cpu_stats
	jruc	cont2

team1_human
	movi	AUD_HUMGAMES,a0		;a human team
	calla	AUD1
	movi	AUD_HUMSCORES,a0
	move	@scores,a1		;human score
	calla	AUD


cont2
	move	@PSTATUS2,a0
	andi	01100b,a0
	jrnz	team2_human
	move	@scores+10h,a4		;CPU SCORE
	move	@scores,a5		;HUMAN SCORE


	movi	AUD_CPUGAMES,a0		;a cpu team
	calla	AUD1
	movi	AUD_CPUSCORES,a0
	move	a4,a1			;cpu score
	calla	AUD
	callr	do_cpu_stats
	rets

team2_human
	movi	AUD_HUMGAMES,a0		;a human team
	calla	AUD1
	movi	AUD_HUMSCORES,a0
	move	@scores+10h,a1		;human score
	calla	AUD



	move	@PSTATUS2,a0
	andi	011b,a0
	jrz	novs
	move	@PSTATUS2,a0
	andi	01100b,a0
	jrz	novs
	movi	AUD_HUMANVSHUMAN,a0
	calla	AUD1
	move	@scores,a0
	move	@scores+10h,a1
	cmp	a1,a0
	jrlo	tm2_wins
	movi	AUD_WINSONLEFT,a0
	calla	AUD1
tm2_wins
novs
	rets



do_cpu_stats

	cmp	a4,a5
	jrhi	cpu_loses

	movi	AUD_CPUWINS,a0		;CPU victories + 1
	calla	AUD1

	movi	AUD_CPUWINMARG,a0
	calla	GET_AUD			;RET in A1

	sub	a5,a4
	cmp	a1,a4
	jrls	not_higher
	move	a4,a1
	movi	AUD_CPUWINMARG,a0	;new win margin
	calla	STORE_AUDIT
	rets

cpu_loses
	movi	AUD_CPULOSMARG,a0
	calla	GET_AUD			;RET in A1

	sub	a4,a5			;HUMAN - CPU SCORE
	cmp	a1,a5
	jrls	not_higher
	move	a5,a1
	movi	AUD_CPULOSMARG,a0	;new loss margin
	calla	STORE_AUDIT
not_higher
	rets




 SUBRP	plyr_endqfinishshot

	movi	TSEC*5/2,a10
shot_lp
	move	@ballpnum,a0
	jrnn	stop			;Somebody has ball?
	move	@ballobj_p,a2,L
	move	*a2(OYPOS),a0
	cmpi	-15,a0
	jrgt	stop			;Ball near gnd?

	SLEEPK	2

gbcnt	dsj	a10,shot_lp

stop
	move	@ballpnum,a0
	jrn	no_owner
	sll	5,a0			;*32
	addi	plyrproc_t,a0
	move	*a0,a0,L
	move	*a0(plyr_seqflgs),a1
	btst	DUNK_B,a1
	jrz	no_owner
	move	*a0(plyr_jmpcnt),a1
	cmpi	15,a1
	jrlt	no_owner

	CREATE0	dobad
no_owner

	movk	1,a0
	callr	plyr_setac

	clr	a0
	move	a0,@P1CTRL,L		;Clr p1 & p2 &
	move	a0,@P3CTRL,L		; p3 & p4
	.if DRONES_2MORE
	move	a0,@P5CTRL,L		; & p5 & p6
	.endif

	movi	clockid,a0
	calla	KIL1C 			;Kill existing shot clock proc
	movi	CLSDEAD|clockid,a0
	calla	obj_del1c		;Delete any 24 second shot clock imgs
	clr	a0
	move	a0,@sc_proc,L
	move	a0,@game_time,L

	movk	1,a0
	move	a0,@HALT

	move	@tvpanelon,a0,L
	jrz	turnon_a

	movi	CLSDEAD|tvid,a0
	clr	a1
	calla	EXISTOBJ
	jrz	turnon_a

	move	@tvpanelon,a0,L
	movi	6*TSEC,a1
	move	a1,*a0(PTIME)
turnon_a

	movi	3*TSEC+10+30,a11
	move	@gmqrtr,a0
	subk	4,a0
	jrn	no_ot
	movi	6*TSEC+10-70+60-20,a11
no_ot
	CREATE0	scr1

	move	@gmqrtr,a0		;Ran out of time
	subk	4,a0
	jrlt	fade
	move	@scores,a0
	move	@scores+16,a1
	cmp	a0,a1
	jreq	fade

	SLEEP	90




	.ref	winning_msg
	CREATE0	winning_msg
	jruc	fade

fade
	SLEEPK	1
	movi	flashpid,a0
	clr	a1
	not	a1
	calla	EXISTP
	jrnz	fade

	calla	pal_clean

	movi	nofade_t,a10
	CREATE0	fade_down_half

plyr_endqfinishshot_x	
    RETP

dobad	SLEEP	100
	SOUND1	baddec_sp
	DIE

nofade_t			;Pals not to fade
	.long	scorep,NEWPLATPP
	.long   SGMD8RED,SGMD8WHT
	.long	textp,cred_p
	.long	ledw,ledr
	.long	NEWPLATPP,NBALOG_P
	.long	TURBO_B_P,TURBO_G_P,TURBO_Y_P,TURBO_R_P
	.long	BST18Y_P,BST18W_P,BST18R_P
	.long	BAST_W_P,BAST_Y_P
	.long	BRUSH_W_P,BRUSH_Y_P,BRUSH_R_P
	.long	HANGF_R_P,HANGF_W_P
	.long	LED_P,TIMPLT_P
	.long	HINT_B_P,HINT_B_P,HINT_B_P,HINT_B_P
	.long	BRSH_R_P
	.long	BALLBAK_P
	.long	FFRAM_B_P
	.long	LOG_ATLP
	.long	LOG_BOSP
	.long	LOG_CHAP
	.long	LOG_CHIP
	.long	LOG_CLEP
	.long	LOG_DALP
	.long	LOG_DENP
	.long	LOG_DETP
	.long	LOG_DETNP
	.long	LOG_GOLP
	.long	LOG_HOUP
	.long	LOG_INDP
	.long	LOG_LACP
	.long	LOG_LALP
	.long	LOG_MIAP
	.long	LOG_MILP
	.long	LOG_MINP
	.long	LOG_MINNP
	.long	LOG_NEJP
	.long	LOG_NEYP
	.long	LOG_ORLP
	.long	LOG_PHIP
	.long	LOG_PHXP
	.long	LOG_PORP
	.long	LOG_SACP
	.long	LOG_SANP
	.long	LOG_SEAP
	.long	LOG_TORP
	.long	LOG_UTAP
	.long	LOG_UTANP
	.long	LOG_VANP
	.long	LOG_WASP
	.long	0





 SUBR	plyr_goaltending

	move	*a11(OPLINK),a11,L
	move	*a11(plyr_num),a0

	srl	1,a0
	move	a0,a11
	XORK	1,a0
	sll	4,a0			;0 or 16

	addi	scores,a0		;+Base
	move	@ballptsforshot,a1
	move	a1,a3
	calla	score_add

	calla	plyr_setptsdown


	movk	PS_2PTS_MADE,a0		;>Inc try shot stat
	subk	2,a3
	jreq	plyr_goaltending_2ptrc
	movk	PS_3PTS_MADE,a0
plyr_goaltending_2ptrc
	move	@ballpnumshot,a1
	calla	inc_player_stat

	calla	prt_top_scores		;Update scores at scrn top

	movi	TSEC*2,a0
	callr	plyr_setshtdly

	CREATE0	goaltend_text

	SOUND1	whitsle_snd

	move	@tvpanelon,a0,L
	jrz	turnon
	movi	4*TSEC+10-70,a1
	move	a1,*a0(PTIME)
	jruc	alrdyon
turnon
	CREATE0	score_showtvpanel
alrdyon

	movi	P1DATA,a10
	calla	stick_number
	movi	P2DATA,a10
	calla	stick_number
	movi	P3DATA,a10
	calla	stick_number
	movi	P4DATA,a10
	calla	stick_number

	SLEEP	30

	clr	a0
	move	a0,@ballptsforshot

	jruc	plyr_takeoutball3


 SUBRP	goaltend_text


	movk	3,a10
	CREATE0	doalert_snd

	move	@game_time,a0,L
	jaz	SUCIDE

	movi	ln0_setup,a2
	calla	setup_message
	move	*a2,a0,L
	move	a0,@mess_justify,L	;justification method
	move	@mess_cursx,a0
	move	a0,@mess_cursx2
	movi	CLSDEAD|123,a0
	move	a0,@mess_objid

	movi	str_goaltend,a4
	calla	print_string2b

	movi	84,a0
	move	a0,@mess_cursx2
	movi	127,a0
	move	a0,@mess_cursy

	addk	8,a4
	calla	print_string2b

	CREATE0	flash_bigtxt
	move	a0,a9

	SLEEP	1*TSEC

	.ref	goal_tend_sp
	SOUND1	goal_tend_sp

	SLEEP	1*TSEC

	move	a9,a0
	calla	KILL

	movi	CLSDEAD|123,a0
	calla	obj_del1c		;delete text


	DIE


ln0_setup
	PRINT_STR	hangfnt38_ascii,9,0,131,77,HANGF_R_P,kern_chars

str_goaltend
	.string	"G",1,-1,"O",1,-5,"A",1,3,"L",0
	.string	"T",1,-6,"E",1,-6,"N",1,-6,"D",1,-2,"I",1,-5,"N",1,-3,"G",0
	.even



	STRUCTPD
	WORD	ptob_pball	;Plyr  (0-3) who gets ball
	WORD	ptob_pball2	;P who gets ball passed to him


 SUBR	plyr_takeoutball



	movi	TOB_PID,a0		;Kill any other plyr_takeoutball
	move	a0,*a13(PROCID)
	calla	KIL1C

	movi	-1,a0
	move	a0,@ballsclastp
	move	a0,@ballshotinair	;Shooter  if shot in air, else -1

	movi	TSEC+20,a0
	callr	plyr_setshtdly
	clr	a0
	move	a0,@P1CTRL,L		;Clr p1 & p2 &
	move	a0,@P3CTRL,L		; p3 & p4
	.if DRONES_2MORE
	move	a0,@P5CTRL,L		; & p5 & p6
	.endif

	SLEEPK	1

	movi	-1,a0
	move	a0,@ballpnum
	move	a0,@ballpnumlast

	movk	1,a0
	callr	plyr_setac

	clr	a0			;Clr staggers
	movi	plyr_stagcnt,a1
	callr	plyr_setprocword

	movi	plyrproc_t,a0		;Assume team 1 is inbounding
	clr	a2
	move	@PSTATUS2,a3
	movk	2,a9
	move	a11,a11
	jrz	t11
	addk	32,a0			;Team 2 is inbounding
	addk	32,a0
	movk	1,a2
	srl	2,a3
	clr	a9
t11
	move	*a0+,a8,L		;A8=*Proc of plyr who gets ball
	move	*a0+,a7,L
	move	a2,@inbound		;Inbounding team (0-1)
	add	a2,a2			;Make 0 or 1 a 0 or 2

	andi	3,a3			;Only look @ selected team bits
	jrz	two_same		;Closest inbounds if both drones
	cmpi	010b,a3
	jreq	plyr_takeoutball_1st			;If human/drone, drone always
	jrlo	plyr_takeoutball_2nd			; inbounds

two_same
	move	*a8(plyr_balldist),a0	;Both drone or human. Plyr closest
	move	*a7(plyr_balldist),a1	; to ball inbounds
	cmp	a1,a0
	jrle	plyr_takeoutball_1st			;1st in team if <=
plyr_takeoutball_2nd
	move	a7,a8			;2nd in team
	addk	1,a2
plyr_takeoutball_1st
	move	a2,*a13(ptob_pball)	;=inbounding plyr 
	XORK	1,a2
	move	a2,*a13(ptob_pball2)	;=inbound teammate plyr 


	movi	TSEC*3,a10		;Max wait for ball to be gotten
gblp1
	movi	-1,a0
	move	a0,@ballpnum
	move	a0,@ballpnumlast

	SLEEPK	1


	.if	DEBUG
	move	@plyrproc_t,a0,L
	move	*a0(plyr_nojoy),a0
	jrnz	lock2
	move	@plyrproc_t+32,a0,L
	move	*a0(plyr_nojoy),a0
	jrnz	lock2
	move	@plyrproc_t+64,a0,L
	move	*a0(plyr_nojoy),a0
	jrnz	lock2
	move	@plyrproc_t+96,a0,L
	move	*a0(plyr_nojoy),a0
	jrz	    debug_ok
lock2
	.if	DEBUG
	LOCKUP
	.endif
debug_ok
	.endif



	callr	plyrtob_moveo3		;Move other plyrs to their spots

	move	@ballobj_p,a3,L		;Figure ball coor for inbounder to
	move	*a3(OXPOS),a0		; chase
	addk	6,a0			;stupid K!!!
	move	*a3(OZPOS),a1
	move	*a13(ptob_pball),a2
	callr	plyrtob_seekxy		;Move inbounder to the ball
	jrz	atball
	dsj	a10,gblp1		;Don't wait longer then A10
	jruc	atball2
atball
	move	*a8(plyr_jmpcnt),a0	;Wait for inbounder to land if still
	jrnz	gblp1			; in a jump but has the ball
atball2
	clr	a0
	move	a0,*a8(plyr_shtdly)


	movi	TSEC*1,a10		;Max wait for ball to be picked up
gblp2
	movi	-1,a0			;Make sure noone has it
	move	a0,@ballpnum
	move	a0,@ballpnumlast
	SLEEPK	1
	move	@ballpnum,a0		;Does anyone have it now?
	jrn	gbcnt2
	move	*a13(ptob_pball),a2
	cmp	a0,a2			;Is it the inbounding plyr? Yes if =
	jreq	gotball
gbcnt2
	callr	plyrtob_moveo3		;Move other plyrs to their spots

	move	@ballobj_p,a3,L		;Figure ball coor for inbounder to
	move	*a3(OXPOS),a0		; chase
	addk	6,a0			;stupid K!!!
	move	*a3(OZPOS),a1
	move	*a13(ptob_pball),a2
	callr	plyrtob_seekxy		;Move inbounder to the ball
	dsj	a10,gblp2		;Don't wait longer then A10
gotball
	move	*a13(ptob_pball),a0	;Grab the ball
	move	a0,@ballpnum
	clr	a0
	move	a0,*a8(plyr_dribmode)


	movi	TSEC*3,a10		;Max wait for inbounder to get OOB
outlp1
	SLEEPK	1

	callr	plyrtob_moveo3		;Move other plyrs to their spots

	movi	-IBX_OOB,a0		;Set X per team inbounding
	move	a11,a11
	jrz	    outl1			;Team2 on def
	neg	a0
outl1	    
    addi	WRLDMID,a0
	movi	IBZ_OOB,a1
	move	*a13(ptob_pball),a2
	move	a2,@ballpnum
	callr	plyrtob_seekxy		;Move inbounder to OOB spot
	jrz	    outofb			;He's there if 0
	dsj	    a10,outlp1		;Don't wait longer then A10
outofb
	movi	-1,a0
	move	a0,*a8(plyr_dribmode)
	calla	call_scores


	movi	TSEC*3,a10		;Max wait for other 3 to get in place
wtlp1
	SLEEPK	1

	callr	plyrtob_moveo3		;Move other plyrs to their spots
	jrz	inposa			;They're there if 0
	dsj	a10,wtlp1		;Don't wait longer then A10
inposa
	SLEEPK	30			;Pause before inbounding

	move	*a13(ptob_pball),a0	;Set inbounder as ball owner
	move	a0,@ballpnum

	movk	20,a0			;Don't call pass on inbound
	move	a0,@last_name_time


plyrtob_dopass
	move	*a13(ptob_pball),a10	;>Pass with turbo
	sll	4,a10
	addi	P1CTRL,a10
	movi	(BUT2_M|BUT3_M)<<8|BUT2_M|BUT3_M,a0
	move	a0,*a10

	movi	TSEC*2,a2		;Max wait for pass to start
waitp
	PUSHP	a2
	SLEEPK	1
	PULLP	a2
	move	*a8(plyr_seqflgs),a0
	btst	PASS_B,a0
	jrnz	passing
	dsj	a2,waitp		;Don't wait longer then A2
passing
	clr	a0			;Clr inbounder PxCRTL

	move	a0,@drone_attempt	;Alley oop jump up attempts

	move	a0,*a10
	not	a0			;Inbounding off
	move	a0,@inbound


	SLEEPK	30
	jruc	runinlp



runinlp
	SLEEPK	1			;Wait till inbounder is back on court
	movi	-IBX_CRT,a0		;Set X per team inbounding
	move	a11,a11
	jrz	    outl2a			;Team2 on def
	neg	a0
outl2a	
    addi	WRLDMID,a0
	movi	IBZ_CRT,a1
	move	*a13(ptob_pball),a2
	callr	plyrtob_seekxy		;Move inbounder to court spot
	jrz	    contg			;Wait till he gets there

	

	jruc	runinlp		;Wait till he gets there
contg
	move	a11,a0
	calla	shot_clock		;New 24

	clr	a0
	move	a0,@plyrinautorbnd	;In case seq didn't clr
	move	a0,@ballflash
	move	a0,@pass_off
	move	a0,@steals_off
	move	a0,@slamming


	move	*a13(ptob_pball),a0
	sll	5,a0
	addi	plyrproc_t,a0
	move	*a0,a0,L
	clr	a14
	move	a14,*a0(plyr_nojoy)

	clr	a0
	callr	plyr_setac

	clr	a0			;Clr staggers
	movi	plyr_stagcnt,a1
	callr	plyr_setprocword

	clr	a0
	movi	plyr_d_cflgs,a1
	callr	plyr_setprocword

	.ref	drone_setuptob
	calla	drone_setuptob



	move	@game_time,a14,L
	cmpi	02040906H,a14
	jrlt	goclock
	SLEEP	45
goclock
	clr	a0
	move	a0,@clock_active	;Start game clock again
	DIE







	.asg	60h,FACE_LEFT
	.asg	20h,FACE_RIGHT

 SUBR	plyr_takeoutball2

	movi	TOB_PID,a0		;Kill any other plyr_takeoutball
	move	a0,*a13(PROCID)
	calla	KIL1C

	movi	-1,a0
	move	a0,@ballsclastp
	move	a0,@ballshotinair	;Shooter  if shot in air, else -1

	movk	1,a0
	callr	plyr_setac

	clr	a0
	move	a0,@P1CTRL,L		;Clr p1 & p2 &
	move	a0,@P3CTRL,L		; p3 & p4
	.if DRONES_2MORE
	move	a0,@P5CTRL,L		; & p5 & p6
	.endif

	move	a0,@WORLDTLY,L			;Set for plyr 1 with the ball
	movi	[WRLDMID-200-MAX_VIEW1+15,0],a1
	movk	1,a2				;Plyr 2 receives
	movi	t1_setup_table,a10
	move	a11,a11
	jrz	setiba
	movk	1,a0				;Set for plyr 4 with the ball
	movi	[WRLDMID-200+MAX_VIEW1-15,0],a1
	movk	2,a2				;Plyr 3 receives
	movi	t2_setup_table,a10
setiba
	move	a0,@inbound		;Inbounding team
	move	a1,@WORLDTLX,L
	subi	[WRLDMID-200,0],a1
	move	a1,@gndx,L
	movi	-1,a0
	move	a0,@ballpnumlast

	move	a2,*a13(ptob_pball2)	;=1|2
	XORK	1,a2
	move	a2,*a13(ptob_pball)	;=0|3
	move	a2,@ballpnum

	PUSH	a13
	sll	5,a2
	movi	plyrobj_t,a8
	add	a2,a8
	move	*a8,a8,L		;*Plyr obj
	addi	plyrproc_t,a2
	move	*a2,a13,L		;*Plyr process
	callr	plyr_setballxyz
	PULL	a13

	move	@pup_court,a0
	jrz	nootd
	.ref	otdscroller_wake,otdscroll_p	;fix no city on otd at half
	move	@otdscroll_p,a0,L
	movi	otdscroller_wake,a14
	move	a14,*a0(PWAKE),L
nootd
	movk	NUMPLYRS,a14			;>Teleport them
init_loop
	PUSH	a14
	move	*a10+,a0		;=Plyr  (0-3)
	move	*a10+,a4		;=ZPOS
	sll	16,a4			;Make it ZVAL
	move	*a10+,a5		;=XPOS
	sll	16,a5			;Make it XVAL
	move	*a10+,a7		;Direction facing
	callr	plyr_init
	PULL	a14
	dsj	a14,init_loop

	SLEEP	60

	movk	20,a0
	move	a0,@last_name_time	;Don't call pass on inbound

	jruc	plyrtob_dopass


t1_setup_table
	.word	0,IBZ_OOB,	WRLDMID-IBX_OOB,	20h	;ply,z,x,face
	.word	1,IBZ_INB,	WRLDMID-IBX_INB,	60h	;ply,z,x,face
	.word	2,IBZ_DEF1,	WRLDMID-IBX_DEF,	60h	;ply,z,x,face
	.word	3,IBZ_DEF2,	WRLDMID-IBX_DEF,	60h	;ply,z,x,face
	.if DRONES_2MORE
	.word	4,IBZ_DEF1,	WRLDMID-IBX_DEF,	60h	;ply,z,x,face
	.word	5,IBZ_DEF2,	WRLDMID-IBX_DEF,	60h	;ply,z,x,face
	.endif

t2_setup_table
	.word	3,IBZ_OOB,	WRLDMID+IBX_OOB,	60h	;ply,z,x,face
	.word	2,IBZ_INB,	WRLDMID+IBX_INB,	20h	;ply,z,x,face
	.word	0,IBZ_DEF1,	WRLDMID+IBX_DEF,	20h	;ply,z,x,face
	.word	1,IBZ_DEF2,	WRLDMID+IBX_DEF,	20h	;ply,z,x,face
	.if DRONES_2MORE
	.word	4,IBZ_DEF1,	WRLDMID+IBX_DEF,	20h	;ply,z,x,face
	.word	5,IBZ_DEF2,	WRLDMID+IBX_DEF,	20h	;ply,z,x,face
	.endif



 SUBR	plyr_takeoutball3

	movi	TOB_PID,a0		;Kill any other plyr_takeoutball
	move	a0,*a13(PROCID)
	calla	KIL1C

	movi	-1,a0
	move	a0,@ballsclastp
	move	a0,@ballshotinair	;Shooter  if shot in air, else -1

	movk	25,a0
	callr	plyr_setshtdly

	SLEEPK	1

	movi	-1,a0
	move	a0,@ballpnum
	move	a0,@ballpnumlast

	move	a11,a0
	jrz	setib
	movk	1,a0
setib
	move	a0,@inbound		;Inbounding team

	movk	1,a0
	callr	plyr_setac

	clr	a0			;Clr staggers
	movi	plyr_stagcnt,a1
	callr	plyr_setprocword

	movk	2,a9			;A9=1st p of team on defense
	movi	plyrproc_t,a0
	move	a11,a2
	jrz	t12
	clr	a9
	addk	32,a0
	addk	32,a0
	movk	2,a2
t12
	move	*a0+,a8,L		;A8=*Proc of plyr who gets ball
	move	*a0+,a7,L
	move	*a8(plyr_hpdist),a0
	move	*a7(plyr_hpdist),a1
	cmp	a1,a0
	jrle	plyr_takeoutball3_1st			;Closer?
	move	a7,a8
	addk	1,a2			;2nd in team
plyr_takeoutball3_1st
	move	a2,*a13(ptob_pball)
	move	a2,@ballpnum
	XORK	1,a2
	move	a2,*a13(ptob_pball2)
	movi	-1,a0
	move	a0,@ballpnumlast

outlp2
	SLEEPK	1

	move	*a13(ptob_pball),a0	;Ensure goaltender has ball
	move	a0,@ballpnum
	clr	a0
	move	a0,*a8(plyr_dribmode)

	callr	plyrtob_moveo3		;Move other plyrs to their spots

	movi	-IBX_OOB,a0		;Set X per team inbounding
	move	a11,a11
	jrz	    outl2			;Team2 on def
	neg	    a0
outl2	    
    addi	WRLDMID,a0
	movi	IBZ_OOB,a1
	move	*a13(ptob_pball),a2
	callr	plyrtob_seekxy		;Move inbounder to OOB spot
	jrnz	outlp2			;He's not there yet if !0


	movi	TSEC*3,a10		;Max wait for other 3 to get in place
wtlp2
	SLEEPK	1

	callr	plyrtob_moveo3		;Move other plyrs to their spots
	jrz	inpos			;They're there if 0
	dsj	a10,wtlp2		;Don't wait longer then A10
inpos
	SLEEP	60			;Pause before inbounding

	jruc	plyrtob_dopass



 SUBR	plyr_init

	PUSH	a8,a10,a13

	sll	5,a0			;x 32 bits
	movi	plyrproc_t,a13
	add	a0,a13
	move	*a13,a13,L		;*plyr process

	addi	plyrobj_t,a0
	move	*a0,a8,L		;*plyr object

	move	a4,*a8(OZVAL),L
	callr	anipt_getsclxy		;a0 = anix, a1 = aniy
	move	a0,*a8(OXANI),L
	neg	a1
	move	a1,*a8(OYVAL),L
	sub	a0,a5
	move	a5,*a8(OXVAL),L

	movk	STND_SEQ,a0
	callr	plyr_setseq

	clr	a0

	move	a0,*a8(OXVEL),L
	move	a0,*a8(OYVEL),L
	move	a0,*a8(OZVEL),L

	move	a0,*a13(plyr_jmpcnt)
	move	a0,*a13(plyr_dribmode)
	move	a0,*a13(plyr_offscrn)
	move	a0,*a13(plyr_d_cflgs)
	move	a0,*a13(plyr_hangcnt)
	move	a0,*a13(plyr_nojoy)
	move	a0,*a13(plyr_shtdly)
	move	a0,*a13(plyr_slam_ticks)
	move	a0,*a13(plyr_rcvpass)
	move	a0,*a13(plyr_ownball)
	move	a0,*a13(plyr_stagcnt)

	movi	-1,a0
	move	a0,*a13(plyr_newdir)

	movk	1,a0
	move	a0,*a13(PA10),L		;reset sequence wake count

	PULL	a8,a10,a13
	rets



 SUBRP	plyr_setac

	movi	plyrproc_t,a14
	movk	NUMPLYRS,b0
aclp0
	move	*a14+,a1,L
	move	a0,*a1(plyr_autoctrl)
	dsj	b0,aclp0

	rets



 SUBR	plyr_setshtdly

	movi	plyrproc_t,a14
	movk	NUMPLYRS,b0
aclp1
	move	*a14+,a1,L
	move	a0,*a1(plyr_shtdly)
	dsj	b0,aclp1

	rets



 SUBRP	plyr_setprocword

	move	a2,b1
	movi	plyrproc_t,a14
	movk	NUMPLYRS,b0
aclp2
	move	*a14+,a2,L
	add	a1,a2
	move	a0,*a2
	dsj	b0,aclp2

	move	b1,a2

	rets



 SUBRP	plyrtob_moveo3

	movi	-IBX_DEF,a0		;Set X's per team inbounding
	movi	-IBX_INB,a4
	move	a11,a11
	jrz	t2			;Team1 gets?
	neg	a0
	neg	a4
t2	addi	WRLDMID,a0
	addi	WRLDMID,a4

	move	a0,a3			;>Send defenders to their spots
	movi	IBZ_DEF1,a1
	move	a9,a2
	callr	plyrtob_seekxy
	PUSH	a0

	move	a3,a0
	movi	IBZ_DEF2,a1
	addk	1,a2
	callr	plyrtob_seekxy
	PUSH	a0

	move	a4,a0			;>Send teammate to spot
	movi	IBZ_INB,a1
	move	*a13(ptob_pball2),a2
	callr	plyrtob_seekxy
	PULL	a1
	or	a1,a0
	PULL	a1
	or	a1,a0

	rets



 SUBRP	plyrtob_seekxy

	PUSH	a2,a8,a11

	move	a0,b0

	sll	4,a2			;*16
	move	a2,a11
	addi	P1CTRL,a11
	sll	1,a2
	addi	plyrobj_t,a2
	move	*a2,a8,L


	move	*a8(OXPOS),a2
	move	*a8(OXANI+16),a14
	add	a14,a2


	sub	a0,a2

	clr	a0

	move	a2,a14
	abs	a2
	subk	10,a2
	jrle	onx
	move	a14,a14
	jrlt	nolft
	subk	4,a0			;Left

nolft	addk	8,a0			;Rgt
onx
	move	*a8(OZPOS),a2


	sub	a1,a2
	move	a2,a14
	abs	a2
	subk	10,a2
	jrle	onz
	move	a14,a14
	jrlt	noup2
	subk	1,a0			;Up

noup2	
    addk	2,a0			;Dn
onz

	move	a0,*a11
	move	a0,a0
	jrnz	plyrtob_seekxy_x

	move	b0,a14
	move	*a8(OXANI+16),a2
	sub	a2,a14
	move	a14,*a8(OXPOS)

	move	a1,*a8(OZPOS)

	move	*a8(OXVEL),a1,L
	sra	1,a1
	move	a1,*a8(OXVEL),L
	move	*a8(OZVEL),a1,L
	sra	1,a1
	move	a1,*a8(OZVEL),L

plyrtob_seekxy_x	
    PULL	a2,a8,a11
	move	a0,a0
	rets



 SUBRP	seekdir_obxz128

	move	*a8(OXPOS),a0		;Get SX
	move	*a8(OXANI+16),a14
	add	a14,a0
	move	*a8(OZPOS),a1		;Get SZ


 SUBR	seekdir_xyxy128

	clr	a2			;Octant 0-1
	sub	a6,a0			;A0=SrcX-DestX
	jrgt	seekdir_xyxy128_o45_67
	abs	a0
	sub	a7,a1			;A1=SrcY-DestY
	jrnn	gotoct1
	movk	2,a2			;Oct 2-3
	abs	a1
	jruc	d_sw1
seekdir_xyxy128_o45_67
	movk	4,a2			;Oct 4-5
	sub	a7,a1			;A1=SrcY-DestX
	abs	a1
	jrnn	o_up1
	movk	6,a2			;Oct 6-7
d_sw1
	SWAP	a0,a1			;Swap XY delts for oct 23 & 67
o_up1
	sll	4,a2			;Oct*16

gotoct1
	clr	a14
	cmp	a1,a0			;0CHmp slope
	jrhs	seekdir_xyxy128_300

	srl	4,a1			;Bigger/16
	jrnz	seekdir_xyxy128_250
	jruc	seekdir_xyxy128_x
lp1
	addk	1,a2			;Next 1/16 oct
	add	    a1,a14			;+1/16
seekdir_xyxy128_250
	cmp	    a0,a14
	jrlo	lp1
	jruc	seekdir_xyxy128_x

seekdir_xyxy128_300
	addk	31,a2			;End of next octant

	srl	4,a0			;Bigger/16
	jrnz	seekdir_xyxy128_350
	jruc	seekdir_xyxy128_x
lp2a
	subk	1,a2			;Next 1/16 oct
	add	a0,a14			;+1/16
seekdir_xyxy128_350
	cmp	a1,a14
	jrlo	lp2a

seekdir_xyxy128_x
	movi	07fH,a0
	and	a2,a0
	rets



 SUBRP	seekdirdist_obob128

	move	*a0(OXPOS),a6		;Get SX
	move	*a0(OXANI+16),a14
	add	a14,a6
	move	*a0(OZPOS),a7		;Get SZ


 SUBR	seekdirdist_obxz128

	move	*a8(OXPOS),a0		;Get SX
	move	*a8(OXANI+16),a14
	add	a14,a0
	move	*a8(OZPOS),a1		;Get SZ

	clr	a2			;Octant 0-1
	sub	a6,a0			;A0=SrcX-DestX
	jrgt	seekdirdist_obxz128_o45_67
	abs	a0
	sub	a7,a1			;A1=SrcY-DestY
	jrnn	gotoct2
	movk	2,a2			;Oct 2-3
	abs	a1
	jruc	d_sw2
seekdirdist_obxz128_o45_67
	movk	4,a2			;Oct 4-5
	sub	a7,a1			;A1=SrcY-DestX
	abs	a1
	jrnn	o_up2
	movk	6,a2			;Oct 6-7
d_sw2
	SWAP	a0,a1			;Swap XY delts for oct 23 & 67
o_up2
	sll	4,a2			;Oct*16

gotoct2
	clr	a14
	cmp	a1,a0			;0CHmp slope
	jrhs	seekdirdist_obxz128_300

	move	a0,b0			;Save distance
	move	a1,b1

	srl	4,a1			;Bigger/16
	jrnz	seekdirdist_obxz128_250
	jruc	seekdirdist_obxz128_x
lp1a
	addk	1,a2			;Next 1/16 oct
	add	a1,a14			;+1/16
seekdirdist_obxz128_250
	cmp	a0,a14
	jrlo	lp1a
	jruc	seekdirdist_obxz128_x

seekdirdist_obxz128_300
	move	a0,b1			;Save distance
	move	a1,b0

	addk	31,a2			;End of next octant

	srl	4,a0			;Bigger/16
	jrnz	seekdirdist_obxz128_350
	jruc	seekdirdist_obxz128_x
lp2b
	subk	1,a2			;Next 1/16 oct
	add	a0,a14			;+1/16
seekdirdist_obxz128_350
	cmp	a1,a14
	jrlo	lp2b

seekdirdist_obxz128_x					;0CaHlc distance (long+short/2.667)
	srl	1,b0			;Shorter/2
	add	b0,b1
	srl	2,b0			;Shorter/8
	sub	b0,b1
	move	b1,a1

	movi	07fH,a0
	and	a2,a0
	rets



 SUBRP	rnd

	move	@RAND,a1,L
	rl	a1,a1
	move	@HCOUNT,a14
	rl	a14,a1
	add	sp,a1
	move	a1,@RAND,L

	and	a1,a0
	rets



 SUBR	rndrng0

	move	@RAND,a1,L
	rl	a1,a1
	move	@HCOUNT,a14
	rl	a14,a1
	add	sp,a1
	move	a1,@RAND,L

	addk	1,a0
	mpyu	a1,a0		;Condition codes not valid!

	rets


	.if CRTALGN


 SUBR	gnd_aligndots

	.ref	hoopl_t,hoopr_t

	movi	alignimg_t,a2
	movi	0800cH|M_NOCOLL|M_3D|M_NOSCALE,a4
	movi	CLSDEAD,a5
	clr	a6
	clr	a7


	.if 0		;1=SHOW 3PT DOTS, 0=DON'T
	movi	pt3_t,a11
	movi	PT3_TOPZ,a3
	jruc	3pstrt
3plp
	neg	a0
	addi	200,a0
	sll	16,a0
	clr	a1			;Y lft
	calla	BEGINOBJ
	movi	0101H,a0
	move	a0,*a8(OCONST)
	move	*a11+,a0		;X rgt
	addi	200,a0
	sll	16,a0
	clr	a1			;Y rgt
	calla	BEGINOBJ
	movi	0101H,a0
	move	a0,*a8(OCONST)
	addk	4,a3			;Z inc
3pstrt	move	*a11,a0			;X lft
	jrnn	3plp
	.endif


	.if 0		;1=SHOW HOOP DOTS, 0=DON'T
	movi	hoopl_t,a11		;>Setup left hoop dots
	jruc	hlstrt
hllp
	sll	16,a0
	move	*a11+,a1		;Y
	sll	16,a1
	move	*a11+,a3		;Z
	move	*a11+,a14
	jrn	hlstrt		;Keep in to not show score pts!
	addi	300,a3
	calla	BEGINOBJ2
	movi	0101H,a0
	move	a0,*a8(OCONST)
	movi	-300,a0
	move	a0,*a8(OMISC)		;Z offset
hlstrt	move	*a11+,a0		;X
	jrnz	hllp			;!End?

	movi	hoopr_t,a11		;>Setup rgt hoop dots
	jruc	hrstrt
hrlp
	sll	16,a0
	move	*a11+,a1		;Y
	sll	16,a1
	move	*a11+,a3		;Z
	move	*a11+,a14
	jrn	hrstrt		;Keep in to not show score pts!
	addi	300,a3
	calla	BEGINOBJ2
	movi	0101H,a0
	move	a0,*a8(OCONST)
	movi	-300,a0
	move	a0,*a8(OMISC)		;Z offset
hrstrt	move	*a11+,a0		;X
	jrnz	hrlp			;!End?
	.endif


	.if 0		;1=SHOW BACKBOARD DOTS, 0=DON'T
	.asg	((BBRD_ZWID/2)*3/32),FC8	;Fudge cnt X offset

	movi	(-BBRD_X+200-FC8) << 16,a0
	movi	(BBRD_Y) << 16,a1
	movi	BBRD_Z+BBRD_ZWID/2,a3
	calla	BEGINOBJ
	movi	0101H,a0
	move	a0,*a8(OCONST)

	movi	(-BBRD_X+200+FC8) << 16,a0
	movi	(BBRD_Y) << 16,a1
	movi	BBRD_Z-BBRD_ZWID/2,a3
	calla	BEGINOBJ
	movi	0101H,a0
	move	a0,*a8(OCONST)

	movi	(-BBRD_X+200-FC8) << 16,a0
	movi	(BBRD_Y-BBRD_YWID) << 16,a1
	movi	BBRD_Z+BBRD_ZWID/2,a3
	calla	BEGINOBJ
	movi	0101H,a0
	move	a0,*a8(OCONST)

	movi	(-BBRD_X+200+FC8) << 16,a0
	movi	(BBRD_Y-BBRD_YWID) << 16,a1
	movi	BBRD_Z-BBRD_ZWID/2,a3
	calla	BEGINOBJ
	movi	0101H,a0
	move	a0,*a8(OCONST)

	movi	(BBRD_X+200+FC8) << 16,a0
	movi	(BBRD_Y) << 16,a1
	movi	BBRD_Z+BBRD_ZWID/2,a3
	calla	BEGINOBJ
	movi	0101H,a0
	move	a0,*a8(OCONST)

	movi	(BBRD_X+200-FC8) << 16,a0
	movi	(BBRD_Y) << 16,a1
	movi	BBRD_Z-BBRD_ZWID/2,a3
	calla	BEGINOBJ
	movi	0101H,a0
	move	a0,*a8(OCONST)

	movi	(BBRD_X+200+FC8) << 16,a0
	movi	(BBRD_Y-BBRD_YWID) << 16,a1
	movi	BBRD_Z+BBRD_ZWID/2,a3
	calla	BEGINOBJ
	movi	0101H,a0
	move	a0,*a8(OCONST)

	movi	(BBRD_X+200-FC8) << 16,a0
	movi	(BBRD_Y-BBRD_YWID) << 16,a1
	movi	BBRD_Z-BBRD_ZWID/2,a3
	calla	BEGINOBJ
	movi	0101H,a0
	move	a0,*a8(OCONST)
	.endif


	.if 0		;1=SHOW COURT DOTS, 0=DON'T
	movi	init_t,a11		;>Setup gnd dot images
	jruc	5
dots_lp
	addi	200,a0
	sll	16,a0
	clr	a1			;Y
	move	*a11+,a3		;Z
	calla	BEGINOBJ
	movi	0101H,a0
	move	a0,*a8(OCONST)
5	move	*a11+,a0		;X
	cmpi	4000,a0
	jrne	dots_lp			;!End?
	.endif



	move	*a8(OPAL),a9
	sll	8,a9
	addk	1,a9			;Color 1
	clr	a10
plp
	move	a10,a0
	addi	color_t,a0
	move	a9,a1
	movk	1,a2			;Colors
	calla	pal_set
	SLEEPK	10
	addk	16,a10
	sll	32-6,a10		;0-3 color 
	srl	32-6,a10
	jruc	plp


x0	.equ	LFTCRT_X-WRLDMID	;-350
x1	.equ	RGTCRT_X-WRLDMID	;350

z0	.equ	GZMIN
z0a	.equ	GZMIN+(CZMIN-GZMIN)/4
z0b	.equ	GZMIN+(CZMIN-GZMIN)/2
z0c	.equ	GZMIN+(CZMIN-GZMIN)*3/4
z1	.equ	CZMIN			;1000
z1a	.equ	CZMIN+(CZMAX-CZMIN)/16
z1b	.equ	CZMIN+(CZMAX-CZMIN)/8
z1c	.equ	CZMIN+(CZMAX-CZMIN)*3/16
z2	.equ	CZMIN+(CZMAX-CZMIN)/4	;1095		
z2a	.equ	CZMIN+(CZMAX-CZMIN)*5/16
z2b	.equ	CZMIN+(CZMAX-CZMIN)*3/8
z2c	.equ	CZMIN+(CZMAX-CZMIN)*7/16
z3	.equ	CZMIN+(CZMAX-CZMIN)/2	;1190
z3a	.equ	CZMIN+(CZMAX-CZMIN)*9/16
z3b	.equ	CZMIN+(CZMAX-CZMIN)*5/8
z3c	.equ	CZMIN+(CZMAX-CZMIN)*11/16
z4	.equ	CZMIN+(CZMAX-CZMIN)*3/4	;1284
z4a	.equ	CZMIN+(CZMAX-CZMIN)*13/16
z4b	.equ	CZMIN+(CZMAX-CZMIN)*7/8
z4c	.equ	CZMIN+(CZMAX-CZMIN)*15/16
z5	.equ	CZMAX

init_t
	.word	4000	;TEMP!!!
	.word	x0,z0,  0,z0,  x1,z0
	.word	x0,z0a, 0,z0a, x1,z0a
	.word	x0,z0b, 0,z0b, x1,z0b
	.word	x0,z0c, 0,z0c, x1,z0c
	.word	x0,z1,  0,z1,  x1,z1
	.word	x0,z1a, 0,z1a, x1,z1a
	.word	x0,z1b, 0,z1b, x1,z1b
	.word	x0,z1c, 0,z1c, x1,z1c
	.word	x0,z2,  0,z2,  x1,z2
	.word	x0,z2a, 0,z2a, x1,z2a
	.word	x0,z2b, 0,z2b, x1,z2b
	.word	x0,z2c, 0,z2c, x1,z2c
	.word	x0,z3,  0,z3,  x1,z3
	.word	x0,z3a, 0,z3a, x1,z3a
	.word	x0,z3b, 0,z3b, x1,z3b
	.word	x0,z3c, 0,z3c, x1,z3c
	.word	x0,z4,  0,z4,  x1,z4
	.word	x0,z4a, 0,z4a, x1,z4a
	.word	x0,z4b, 0,z4b, x1,z4b
	.word	x0,z4c, 0,z4c, x1,z4c
	.word	x0,z5,  0,z5,  x1,z5
	.word	4000

color_t
	COLORW	0,0,0, 0,16,0, 0,31,0, 0,16,0

alignimg_t
	.word	1,1,0,0
	.long	0
	.word	01000H
	.long	test_p

test_p	.word	1, 0

	.endif

	.end
