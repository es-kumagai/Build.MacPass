SOURCE_PATH=${CURDIR}/MacPass-Sources
DERIVEDDATA_PATH=${CURDIR}/DerivedData
MAKE_MACPASS=@make -C ${SOURCE_PATH} -f ${MACPASS_MAKEFILE}
MACPASS_APP=${DERIVEDDATA_PATH}/Build/Products/Release/MacPass.app
MACPASS_MAKEFILE=${CURDIR}/Makefile.MacPass
APPLICATION_DIR=~/Applications

build:
	$(MAKE_MACPASS) build

clean:
	rm -rf ${DERIVEDDATA_PATH}

prepare:
	@make download

install:
	cp -rf ${MACPASS_APP} ${APPLICATION_DIR}
	
link:
	ln -fs ${MACPASS_APP} ${APPLICATION_DIR}

download:
	rm -rf ${SOURCE_PATH}
	git clone https://github.com/mstarke/MacPass ${SOURCE_PATH} --recursive
	$(MAKE_MACPASS) bootstrap

update:
	$(MAKE_MACPASS) update
