build:
	wget -O Python-3.8.16.tgz https://www.python.org/ftp/python/3.8.16/Python-3.8.16.tgz
	tar -xf Python-3.8.16.tgz
	cd Python-3.8.16 ; ./configure --prefix=/ --enable-optimizations --with-lto
	make -C Python-3.8.16 -j`nproc`

install:
	make -C Python-3.8.16 -j`nproc` install DESTDIR=$(DESTDIR)/opt/python3.8

clean:
	rm -rf Python-3.8.16.tgz Python-3.8.16
