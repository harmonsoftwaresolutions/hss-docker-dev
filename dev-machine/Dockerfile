FROM centos:latest

# ROOT Core Software
RUN yum update -y
RUN yum install -y sudo autoconf automake make cmake gcc gcc-c++ \
	libxslt-dev libxml2-dev libssl-dev libtool pkgconfig unzip wget openssh git \
	which kernel-devel ncurses-devel bzip2
RUN yum install -y epel-release python python-devel python34 python34-devel

# Updated VIM
# RUN mkdir -p /home/hss/.bin /home/hss/.config/nvim/
WORKDIR /home/hss/.bin
RUN wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2 && tar xvjf vim-7.4.tar.bz2
WORKDIR /home/hss/.bin/vim74
RUN ./configure --with-features=huge \
	--enable-multibyte \
	--enable-pythoninterp \
RUN make --silent && make install
RUN rm -rf /home/hss/.bin/vim74 /home/hss/.bin/vim-7.4.tar.bz2

RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN /usr/bin/python2.7 get-pip.py
RUN pip install neovim

## NEOVIM
RUN git clone https://github.com/neovim/neovim && cd neovim && make --silent && make install
# RUN curl -L https://gist.github.com/evanharmon/7f766c946d38770a66b2/raw | tee -i /home/dev/.config/nvim/init.vim
# RUN curl -L https://gist.github.com/evanharmon/0ba1fa0395cc054ab827/raw | tee -i /home/dev/.config/nvim/mysnippets/javascript.snippets
# RUN curl -L https://gist.github.com/evanharmon/ce9d1399d519934311da/raw | tee -i /home/dev/.config/nvim/mysnippets/jsx.snippets
# RUN curl -L https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | tee -i /home/dev/.config/nvim/autoload/plug.vim
# RUN rm -rf /home/hss/.bin/neovim

## Home Environment / USER
RUN useradd -ms /bin/bash hss
RUN chown -R hss:hss /home/hss
ENV PATH /home/hss:$PATH
ENV HOME /home/hss
WORKDIR /home/hss
RUN yum install -y zsh
RUN usermod -s /bin/zsh hss
USER hss
# RUN curl -L https://gist.github.com/evanharmon/2af3fe2e4b7065d59093/raw | tee -i /home/hss/.bashrc
WORKDIR /home/hss
COPY hss-cfg/ /home/hss/
CMD ["symlink-prezto.sh"]
