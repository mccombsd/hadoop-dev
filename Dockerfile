FROM centos:7
MAINTAINER Drew McCombs <drew.mccombs@gmail.com>
RUN yum install -y curl which tar sudo
#
# Installing Java
RUN curl -LO 'http://download.oracle.com/otn-pub/java/jdk/8u91-b14/jdk-8u91-linux-x64.rpm' -H 'Cookie: oraclelicense=accept-securebackup-cookie'
RUN rpm -i jdk-8u91-linux-x64.rpm
RUN rm jdk-8u91-linux-x64.rpm
ENV JAVA_HOME /usr/java/default
#
# Installing Hadoop
RUN curl -s http://www.eu.apache.org/dist/hadoop/common/hadoop-2.7.1/hadoop-2.7.1.tar.gz | tar -xz -C /usr/local/
ENV HADOOP_VERSION 2.7.1
ENV HADOOP_ROOT /usr/local/hadoop-2.7.1
ENV HADOOP_HOME $HADOOP_ROOT/share/hadoop
