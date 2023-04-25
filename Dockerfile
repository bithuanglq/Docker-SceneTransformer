FROM python:3.9

LABEL "Author"="Liqun Huang"
LABEL "Email"="2728679381@qq.com"

USER root
WORKDIR /root

RUN apt update && \
    mkdir .pip && cd .pip && touch pip.conf && \
    apt install vim -y && \
    echo "[global]" >> pip.conf && \
    echo "index-url = https://pypi.tuna.tsinghua.edu.cn/simple" >> pip.conf 

WORKDIR /mnt

RUN mkdir SceneTransformer
COPY SceneTransformer ./SceneTransformer
COPY README.md ./

RUN apt install libgl-dev -y
RUN pip install tqdm \
                tfrecord \
                matplotlib \
                hydra-core \
                waymo-open-dataset-tf-2-11-0==1.5.1 \
                pytorch-lightning==1.9.5 

CMD [ "/bin/bash" ]