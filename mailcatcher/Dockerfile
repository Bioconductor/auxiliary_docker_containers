FROM schickling/mailcatcher

RUN gem uninstall mailcatcher
RUN gem install mailcatcher -v 0.5.12


CMD ["mailcatcher", "-f", "--ip=0.0.0.0"]