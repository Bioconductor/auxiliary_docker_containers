FROM bioconductor/devel_sequencing

RUN apt-get install -y python-dev libzmq3-dev libcurl4-openssl-dev libssl-dev

EXPOSE 8888

RUN pip install ipython 
RUN pip install pyzmq 
RUN pip install jinja2 
RUN pip install tornado 
RUN pip install jsonschema

RUN R -e "biocLite('devtools')"

RUN R -e "devtools::install_github('armstrtw/rzmq')"

RUN R -e "devtools::install_github('IRkernel/repr')"

RUN R -e "devtools::install_github('IRkernel/IRdisplay')"

RUN R -e "devtools::install_github('IRkernel/IRkernel')"

RUN R -e "biocLite('airway')"

RUN R -e 'IRkernel::installspec()'

RUN ipython profile create nbserver

RUN sed -i.bak "s/# c.NotebookApp.ip = 'localhost'/c.NotebookApp.ip = '0.0.0.0'/" /root/.ipython/profile_nbserver/ipython_notebook_config.py

RUN mkdir /nbserver

WORKDIR /nbserver

CMD ipython notebook --profile=nbserver
