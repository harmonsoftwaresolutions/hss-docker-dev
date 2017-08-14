FROM centos:latest

# ROOT Core Software
RUN yum update -y
RUN yum install -y sudo autoconf automake make cmake gcc gcc-c++ \
	libxslt-dev libxml2-dev libssl-dev libtool pkgconfig unzip wget openssh git \
	which kernel-devel ncurses-devel bzip2 luafilesystem epel-release

# ROOT PYTHON 2 & 3
RUN yum install -y python python-devel python34 python34-devel
RUN yum install -y python34 python34-devel

# ROOT Updated VIM
WORKDIR /tmp
RUN git clone https://github.com/vim/vim.git
WORKDIR /tmp/vim

RUN ./configure --with-features=huge \
	--enable-multibyte \
	--enable-pythoninterp \
RUN make --silent && make install

# ROOT NEOVIM
WORKDIR /tmp
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN /usr/bin/python2.7 get-pip.py
RUN /usr/bin/python3 get-pip.py
RUN pip install neovim
RUN git clone https://github.com/neovim/neovim && cd neovim && make --silent && make install

# ROOT Home Environment User Setup
RUN usermod -s /bin/zsh root
ENV PATH /home/hss:$PATH
ENV HOME /home/hss
RUN yum install -y zsh tree
RUN pip install --upgrade awscli

# SETUP HSS CONFIG WITH .zprezto
WORKDIR /home/hss/
COPY run.sh /home/hss/run.sh
COPY hss-cfg/ /home/hss/
COPY zprezto/ /home/hss/.zprezto
COPY symlink-prezto.sh /home/hss/
RUN /home/hss/symlink-prezto.sh

# ROOT Neovim Plugins in HSS config
WORKDIR /home/hss/.config/nvim/
RUN curl -O https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
RUN chmod 755 /home/hss/.config/nvim/installer.sh
RUN /home/hss/.config/nvim/installer.sh ./

# HSS USER WITH ZSH
RUN useradd -ms /bin/bash hss
RUN chown -R hss:hss /home/hss
USER hss

CMD ["/home/hss/run.sh"]
