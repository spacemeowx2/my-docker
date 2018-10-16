FROM ubuntu:18.04
LABEL maintainer="spacemeowx2@gmail.com"

ENV PWNLIB_NOTERM=1
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
        && sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

RUN apt update \
        && apt install -y \
            python-pip zsh git gdb openssh-server \
        && rm -rf /var/lib/apt/lists/*

RUN pip install pwntools

RUN git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
        && git clone --depth=1 https://github.com/longld/peda.git ~/peda
RUN cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
        && echo "source ~/peda/peda.py" >> ~/.gdbinit \
        && chsh -s /bin/zsh \
        && mkdir /var/run/sshd \
        && mkdir /root/.ssh
COPY ./tmp/id_rsa.pub /root/.ssh/authorized_keys
RUN chown root:root /root/.ssh/authorized_keys \
        && chmod 600 /root/.ssh/authorized_keys

VOLUME [ "/ctf" ]
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D", "-d"]
