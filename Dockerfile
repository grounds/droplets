FROM ruby:2.1.2

# Install dependencies
RUN apt-get update -q && \
    apt-get install -y \
    unzip \
    wget

# Install packer
RUN cd ~/ && \
    mkdir packer && \
    cd packer && \
    wget https://dl.bintray.com/mitchellh/packer/0.7.1_linux_386.zip && \
    unzip 0.7.1_linux_386.zip

# Add packer to path    
ENV PATH $PATH:~/packer/

# Copy project files
COPY . /droplets

# Set the final working dir to the project directory
WORKDIR /droplets

# Default droplet region (Amsterdam 3)
ENV REGION Amsterdam 3

# Default droplet size (512MB)
ENV SIZE 512MB

ENTRYPOINT ["/packer/packer-packer"]
