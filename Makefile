.PHONY:	rpm clean

VERSION ?= 3.4.8
BUILD_NUMBER ?= 1
SOURCE = zookeeper-$(VERSION).tar.gz
TOPDIR = /tmp/zookeeper-rpm
PWD = $(shell pwd)
URL = $(shell curl -s https://www.apache.org/dyn/closer.cgi/zookeeper/zookeeper-$(VERSION)/zookeeper-$(VERSION).tar.gz?asjson=1 | python -c 'import sys,json; data=json.load(sys.stdin); print data["preferred"] + data["path_info"]')

rpm: $(SOURCE)
	@DISTRIBUTION=el7 \
	 REQUIRES_PRE_POST="chkconfig initscripts" \
	 rpmbuild -v -bb \
			--define "_sourcedir $(PWD)" \
			--define "_rpmdir $(PWD)" \
			--define "_topdir $(TOPDIR)-el7" \
			--define "version $(VERSION)" \
			--define "build_number $(BUILD_NUMBER)" \
			zookeeper.spec

sles: $(SOURCE)
	@DISTRIBUTION=sles \
	 REQUIRES_PRE_POST="aaa_base" \
	 rpmbuild -v -bb \
			--define "_sourcedir $(PWD)" \
			--define "_rpmdir $(PWD)" \
			--define "_topdir $(TOPDIR)-sles" \
			--define "version $(VERSION)" \
			--define "build_number $(BUILD_NUMBER)" \
			zookeeper.spec

source: $(SOURCE)

$(SOURCE): KEYS $(SOURCE).asc
	@wget -q $(URL)
	gpg --verify $(SOURCE).asc $(SOURCE)

clean:
	@rm -rf $(TOPDIR) x86_64
	@rm -f $(SOURCE)

$(SOURCE).asc:
	@wget -q https://dist.apache.org/repos/dist/release/zookeeper/zookeeper-$(VERSION)/$(SOURCE).asc

KEYS:
	@wget -q https://dist.apache.org/repos/dist/release/zookeeper/KEYS
	gpg --import KEYS
