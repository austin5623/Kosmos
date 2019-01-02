.DEFAULT_GOAL := release

all: hekate atmos hbloader hbmenu ftpd netcheat mitm appstore updater cfwsettings goldleaf edizon


hekate:
	$(MAKE) -C apps/hekate all

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

hbloader:
	$(MAKE) -C apps/nx-hbloader

hbmenu:
	$(MAKE) -C apps/nx-hbmenu nx

ftpd:
	$(MAKE) -C apps/sys-ftpd

netcheat:
	$(MAKE) -C apps/sys-netcheat

mitm:
	$(MAKE) -C apps/ldn_mitm

appstore:
	$(MAKE) -C apps/hb-appstore -f Makefile.switch

updater:
	$(MAKE) -C apps/Kosmos-Updater

cfwsettings:
	$(MAKE) -C apps/CFW-Settings

goldleaf:
	$(MAKE) -C apps/Goldleaf/Goldleaf

edizon:
	$(MAKE) -C apps/EdiZon

stic:
	mkdir out
	mkdir out/sd
	mkdir out/sd/atmosphere
	mkdir out/sd/bootloader
	mkdir out/sd/bootloader/sys
	mkdir out/sd/modules
	mkdir out/sd/switch

	cp -r static/* out/sd/



	cp apps/hekate/output/hekate.bin out/
	cp apps/hekate/output/libsys_lp0.bso out/sd/bootloader/sys/


	mkdir out/sd/modules/required
	mkdir out/sd/atmosphere/titles
	mkdir out/sd/atmosphere/titles/0100000000000036
	mkdir out/sd/atmosphere/titles/0100000000000034
	mkdir out/sd/atmosphere/titles/0100000000000032

	cp apps/Atmosphere/common/defaults/loader.ini out/sd/atmosphere/loader.ini
	cp apps/Atmosphere/stratosphere/creport/creport.nsp out/sd/atmosphere/titles/0100000000000036/exefs.nsp
	cp apps/Atmosphere/stratosphere/fatal/fatal.nsp out/sd/atmosphere/titles/0100000000000034/exefs.nsp
	cp apps/Atmosphere/stratosphere/set_mitm/set_mitm.nsp out/sd/atmosphere/titles/0100000000000032/exefs.nsp
	cp apps/Atmosphere/stratosphere/fs_mitm/fs_mitm.kip out/sd/modules/required/
	cp apps/Atmosphere/stratosphere/loader/loader.kip out/sd/modules/required/
	cp apps/Atmosphere/stratosphere/pm/pm.kip out/sd/modules/required/
	cp apps/Atmosphere/stratosphere/sm/sm.kip out/sd/modules/required/


	cp apps/nx-hbloader/hbl.nsp out/sd/atmosphere/


	cp apps/nx-hbmenu/nx-hbmenu.nro out/sd/hbmenu.nro


	mkdir out/sd/ftpd
	mkdir out/sd/modules/sys-ftpd
	cp apps/sys-ftpd/sys-ftpd.kip out/sd/modules/sys-ftpd/
	cp apps/sys-ftpd/sd_card/ftpd/* out/sd/ftpd/


	mkdir out/sd/modules/sys-netcheat
	cp apps/sys-netcheat/sys-netcheat.kip out/sd/modules/sys-netcheat/


	mkdir out/sd/modules/ldn_mitm
	cp apps/ldn_mitm/ldn_mitm/ldn_mitm.kip out/sd/modules/ldn_mitm/


	mkdir out/sd/switch/appstore
	cp apps/hb-appstore/appstore.nro out/sd/switch/appstore/


	mkdir out/sd/switch/KosmosUpdater
	cp apps/Kosmos-Updater/dist/Kosmos-Updater.nro out/sd/switch/KosmosUpdater/


	mkdir out/sd/switch/CFWSettings
	cp apps/CFW-Settings/out/CFW-Settings.nro out/sd/switch/CFWSettings/


	mkdir out/sd/switch/Goldleaf
	cp apps/Goldleaf/Goldleaf/Output/Goldleaf.nro out/sd/switch/Goldleaf/


	mkdir out/sd/switch/EdiZon
	cp apps/EdiZon/out/EdiZon.nro out/sd/switch/EdiZon/



	cd out; zip -r -9 ../out.zip ./*; cd ../;


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
	rm -rf out
	rm -f out.zip

release:
	git submodule foreach 'git checkout $$(git describe --abbrev=0 --tag)'
	$(MAKE) all
	$(MAKE) stic

set-release: clean
	git submodule foreach 'git checkout $$(git describe --abbrev=0 --tag)'

nightly:
	git submodule update --init --force --remote --recursive
	$(MAKE) all
	$(MAKE) stic

set-nightly: clean
	git submodule update --init --force --remote --recursive