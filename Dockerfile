FROM tiangolo/uvicorn-gunicorn-fastapi
RUN pip install --upgrade pip -i https://pypi.tuna.tsinghua.edu.cn/simple some-package
RUN cd /app && pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple some-package
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
RUN echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free" >>/etc/apt/sources.list
RUN echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free" >>/etc/apt/sources.list
RUN echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free" >>/etc/apt/sources.list
RUN apt-get update
RUN apt install libgl1-mesa-glx -y
COPY ./app /app
