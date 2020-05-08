FROM ubuntu:18.04

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y gradle maven git libpcap-dev

RUN git clone https://github.com/CanadianInstituteForCybersecurity/CICFlowMeter /code
RUN cd /code/jnetpcap/linux/jnetpcap-1.4.r1425 && \
    mvn install:install-file \
        -Dfile=jnetpcap.jar -DgroupId=org.jnetpcap -DartifactId=jnetpcap \
        -Dversion=1.4.1 -Dpackaging=jar
WORKDIR /code
RUN gradle --no-daemon build

COPY gradle-task /gradle-task
RUN cat /gradle-task >>build.gradle && rm /gradle-task

COPY go /go
RUN chmod 500 /go
ENTRYPOINT ["/go"]
