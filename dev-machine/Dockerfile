FROM centos:latest

# ROOT Core Software
RUN yum update -y
RUN yum install -y sudo autoconf automake make cmake gcc gcc-c++ \
	libxslt-dev libxml2-dev libssl-dev libtool pkgconfig unzip wget openssh git \
	which kernel-devel ncurses-devel bzip2 luafilesystem
RUN yum install -y epel-release python python-devel python34 python34-devel

# ROOT Updated VIM
WORKDIR /tmp
RUN git clone https://github.com/vim/vim.git
WORKDIR /tmp/vim

RUN ./configure --with-features=huge \
	--enable-multibyte \
	--enable-pythoninterp \
RUN make --silent && make install

RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN /usr/bin/python2.7 get-pip.py
RUN pip install neovim

# ROOT NEOVIM
RUN git clone https://github.com/neovim/neovim && cd neovim && make --silent && make install

# ROOT Home Environment User Setup
RUN usermod -s /bin/zsh root
RUN yum install -y zsh
RUN useradd -ms /bin/zsh hss
ENV PATH /home/hss:$PATH
ENV HOME /home/hss
RUN chown -R hss:hss /home/hss

# USER
USER hss
WORKDIR /home
COPY hss-cfg/ ./
COPY symlink-prezto.sh ./
CMD ["symlink-prezto.sh"]
