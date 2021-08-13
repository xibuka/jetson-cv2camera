FROM wenhan/jetson-nano-cuda-opencv:v1

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

COPY stream-video-browser-gpu/ /

RUN apt update && \
    apt -y install python-pip && \
    pip install imutils flask && \
    mkdir /data && chmod 777 /data

ENTRYPOINT ["python", "/webstreaming.py"]
CMD ["--ip", "0.0.0.0", "--port", "80", "-o", "/data/motion.avi"]
