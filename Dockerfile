FROM meanbee/magento:5.6-cli

MAINTAINER Nick Jones <nick.jones@meanbee.com>

# Download specific version
RUN curl -o /mageconfigsync.phar -L "https://github.com/punkstar/mageconfigsync/releases/download/0.4.0/mageconfigsync-0.4.0.phar" \
    && chmod +x /mageconfigsync.phar

# Add our wrapper
COPY mageconfigsync-wrapper.sh /mageconfigsync-wrapper.sh
RUN chmod +x /mageconfigsync-wrapper.sh

# Allow for mageconfigsync commands to be specified
ENTRYPOINT [ "/mageconfigsync-wrapper.sh" ]
