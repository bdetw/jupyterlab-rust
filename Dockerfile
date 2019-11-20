FROM archlinux/base:latest

ENV PATH $PATH:/jupyter/.cargo/bin

RUN pacman -Sy --noconfirm rust jupyterlab cmake base-devel
RUN rm -rf /var/cache/pacman
RUN useradd -m -d /jupyter -U jupyter

USER jupyter
RUN mkdir -p /jupyter/notebooks
WORKDIR /jupyter/notebooks
RUN cargo install evcxr_jupyter
RUN evcxr_jupyter --install
ADD --chown=jupyter:jupyter .jupyter /jupyter/.jupyter

EXPOSE 8888
CMD [ "/usr/bin/jupyter", "lab", "--no-browser", "--ip=0.0.0.0" ]
