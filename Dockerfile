# creating from alpine image of linux (5MB)
FROM alpine:latest

# Install dependencies
RUN apk add --no-cache curl bash

# Install Cosdata server
RUN curl -sL https://cosdata.io/install.sh | bash

# Expose port 8443 for the server
EXPOSE 8443

# Expose port 50051 for the server
EXPOSE 50051

# Create an enviornment variable for cosdata directory
ENV COSDATA_HOME=/root/cosdata-v0.1.0-alpha

# Changing the ip 127.0.0.1 to 0.0.0.0 because the former can be accessed only through docker terminal and latter let us expose the port to all interfaces
RUN sed -i 's/host = "127.0.0.1"/host = "0.0.0.0"/' $COSDATA_HOME/config/config.toml

# Final command to start the cosdata server (start-cosdata)
CMD ["bash", "-c", "$COSDATA_HOME/bin/start-cosdata"]

