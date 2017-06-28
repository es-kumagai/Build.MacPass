SOURCE_PATH=${CURDIR}/MacPass-Sources
DERIVEDDATA_PATH=${CURDIR}/DerivedData
MAKE_MACPASS=@make -C ${SOURCE_PATH} -f ${MACPASS_MAKEFILE}
MACPASS_APP=${DERIVEDDATA_PATH}/Build/Products/Release/MacPass.app
MACPASS_MAKEFILE=${CURDIR}/Makefile.MacPass

build:
	$(MAKE_MACPASS) build

prepare:
	@make download
	@make link
	
link:
	ln -s ${MACPASS_APP} .

download:
	git clone https://github.com/mstarke/MacPass ${SOURCE_PATH} --recursive
	$(MAKE_MACPASS) bootstrap

update:
	$(MAKE_MACPASS) update
