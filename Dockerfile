FROM ruby:2.1.2

# Install dependencies
RUN apt-get update -q && \
    apt-get install -y unzip

# Install tugboat
RUN gem install tugboat

# Install tugboat
RUN cd ~/ && \
    mkdir packer && \
    cd packer && \
    sudo unzip 0.3.6_linux_386.zip

# Add packer to path    
ENV PATH $PATH:~/packer/

# Copy project files
COPY . /do-droplets

# Set the final working dir to the project directory
WORKDIR /do-droplets