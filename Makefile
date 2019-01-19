.DEFAULT_GOAL := release

all: hekate atmos hbloader hbmenu ftpd netcheat mitm appstore updater cfwsettings goldleaf edizon lockpick


hekate:
	$(MAKE) -C apps/hekate all

	mkdir out/sd/bootloader/sys -p
	cp apps/hekate/output/hekate.bin out/
	cp apps/hekate/output/libsys_lp0.bso out/sd/bootloader/sys/

atmos:
	$(MAKE) -C apps/Atmosphere\exosphere
	$(MAKE) -C apps/Atmosphere\stratosphere\libstratosphere
	$(MAKE) -C apps/Atmosphere\stratosphere\creport
	$(MAKE) -C apps/Atmosphere\stratosphere\fatal
	$(MAKE) -C apps/Atmosphere\stratosphere\fs_mitm
	$(MAKE) -C apps/Atmosphere\stratosphere\loader
	$(MAKE) -C apps/Atmosphere\stratosphere\pm
	$(MAKE) -C apps/Atmosphere\stratosphere\set_mitm
	$(MAKE) -C apps/Atmosphere\stratosphere\sm

	mkdir out/sd/modules/required -p
	mkdir out/sd/atmosphere/titles -p
	mkdir out/sd/atmosphere/titles/0100000000000036 -p
	mkdir out/sd/atmosphere/titles/0100000000000034 -p
	mkdir out/sd/atmosphere/titles/0100000000000032 -p

	cp apps/Atmosphere/common/defaults/loader.ini out/sd/atmosphere/loader.ini
	cp apps/Atmosphere/stratosphere/creport/creport.nsp out/sd/atmosphere/titles/0100000000000036/exefs.nsp
	cp apps/Atmosphere/stratosphere/fatal/fatal.nsp out/sd/atmosphere/titles/0100000000000034/exefs.nsp
	cp apps/Atmosphere/stratosphere/set_mitm/set_mitm.nsp out/sd/atmosphere/titles/0100000000000032/exefs.nsp
	cp apps/Atmosphere/stratosphere/fs_mitm/fs_mitm.kip out/sd/modules/required/
	cp apps/Atmosphere/stratosphere/loader/loader.kip out/sd/modules/required/
	cp apps/Atmosphere/stratosphere/pm/pm.kip out/sd/modules/required/
	cp apps/Atmosphere/stratosphere/sm/sm.kip out/sd/modules/required/

hbloader:
	$(MAKE) -C apps/nx-hbloader

	mkdir out/sd/atmosphere/ -p
	cp apps/nx-hbloader/hbl.nsp out/sd/atmosphere/

hbmenu:
	$(MAKE) -C apps/nx-hbmenu nx

	mkdir out/sd/ -p
	cp apps/nx-hbmenu/nx-hbmenu.nro out/sd/hbmenu.nro

ftpd:
	$(MAKE) -C apps/sys-ftpd

	#mkdir out/sd/modules -p
	#mkdir out/sd/ftpd -p
	#mkdir out/sd/modules/sys-ftpd -p
	#cp apps/sys-ftpd/sys-ftpd.kip out/sd/modules/sys-ftpd/
	#cp apps/sys-ftpd/sd_card/ftpd/* out/sd/ftpd/

netcheat:
	$(MAKE) -C apps/sys-netcheat
	
	mkdir out/sd/modules -p
	mkdir out/sd/modules/sys-netcheat -p
	cp apps/sys-netcheat/sys-netcheat.kip out/sd/modules/sys-netcheat/

mitm:
	$(MAKE) -C apps/ldn_mitm
	
	mkdir out/sd/modules -p
	mkdir out/sd/modules/ldn_mitm -p
	cp apps/ldn_mitm/ldn_mitm/ldn_mitm.kip out/sd/modules/ldn_mitm/

appstore:
	$(MAKE) -C apps/hb-appstore -f Makefile.switch

	mkdir out/sd/switch -p
	mkdir out/sd/switch/appstore -p
	cp apps/hb-appstore/appstore.nro out/sd/switch/appstore/

updater:
	$(MAKE) -C apps/Kosmos-Updater

	mkdir out/sd/switch -p
	mkdir out/sd/switch/KosmosUpdater -p
	cp apps/Kosmos-Updater/dist/Kosmos-Updater.nro out/sd/switch/KosmosUpdater/

cfwsettings:
	$(MAKE) -C apps/CFW-Settings

	mkdir out/sd/switch -p
	mkdir out/sd/switch/CFWSettings -p
	cp apps/CFW-Settings/out/CFW-Settings.nro out/sd/switch/CFWSettings/

goldleaf:
	$(MAKE) -C apps/Goldleaf/Goldleaf

	mkdir out/sd/switch -p
	mkdir out/sd/switch/Goldleaf -p
	cp apps/Goldleaf/Goldleaf/Output/Goldleaf.nro out/sd/switch/Goldleaf/

edizon:
	$(MAKE) -C apps/EdiZon

	mkdir out/sd/switch -p
	mkdir out/sd/switch/EdiZon -p
	cp apps/EdiZon/out/EdiZon.nro out/sd/switch/EdiZon/

lockpick:
	$(MAKE) -C apps/Lockpick

	mkdir out/sd/switch -p
	mkdir out/sd/switch/Lockpick -p
	cp apps/Lockpick/out/Lockpick.nro out/sd/switch/Lockpick/


clean:
	$(MAKE) -C apps/hekate clean
	$(MAKE) -C apps/Atmosphere clean
	$(MAKE) -C apps/nx-hbloader clean
	$(MAKE) -C apps/nx-hbmenu clean
	$(MAKE) -C apps/sys-ftpd clean
	$(MAKE) -C apps/sys-netcheat clean
	$(MAKE) -C apps/ldn_mitm clean
	$(MAKE) -C apps/hb-appstore clean
	$(MAKE) -C apps/EdiZon clean
	$(MAKE) -C apps/CFW-Settings clean
	$(MAKE) -C apps/Kosmos-Updater clean
	rm -rf out*
	#rm -f out.zip

release:
	git submodule foreach 'git checkout $$(git describe --abbrev=0 --tag)'
	$(MAKE) all
	cp -r static/* out/sd/
	cd out; zip -r -9 ../out.zip ./*; cd ../;

set-release: clean
	git submodule foreach 'git checkout $$(git describe --abbrev=0 --tag)'

nightly:
	git submodule update --init --force --remote --recursive
	$(MAKE) all
	cp -r static/* out/sd/
	cd out; zip -r -9 ../out.zip ./*; cd ../;

set-nightly: clean
	git submodule update --init --force --remote --recursive