build:
	wget -O Python-3.8.16.tgz https://www.python.org/ftp/python/3.8.16/Python-3.8.16.tgz
	tar -xf Python-3.8.16.tgz
	cd Python-3.8.16 ; ./configure --prefix=/ --libdir=/ --bindir=/
	make -C Python-3.8.16 -j`nproc`

install:
	make -C Python-3.8.16 -j`nproc` install DESTDIR=$(DESTDIR)/opt/python3.8 || true
	rm -rvf $(DESTDIR)/opt/python3.8/2to3
	rm -rvf $(DESTDIR)/opt/python3.8/idle3
	rm -rvf $(DESTDIR)/opt/python3.8/pydoc3
	rm -rvf $(DESTDIR)/opt/python3.8/libpython3.8.a
	rm -rvf $(DESTDIR)/opt/python3.8/include
	rm -rvf $(DESTDIR)/opt/python3.8/pkgconfig
	rm -rvf $(DESTDIR)/opt/python3.8/share
	rm -rvf $(DESTDIR)/opt/python3.8/lib/python3.8/test
	find $(DESTDIR) -type d | grep "__pycache__" | xargs rm -rvf
	install -dm755 $(DESTDIR)/usr/bin/
	ln -s ../../opt/python3.8/python3/python $(DESTDIR)/usr/bin/python3.8


clean:
	rm -rf Python-3.8.16.tgz Python-3.8.16
