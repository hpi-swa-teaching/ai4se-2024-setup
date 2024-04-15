FROM nvcr.io/nvidia/pytorch:24.03-py3
WORKDIR /root
COPY requirements.txt ./
RUN pip install -r requirements.txt --upgrade
RUN pip install jupyterlab ipywidgets --upgrade
WORKDIR /workspace
CMD jupyter lab --no-browser --ip 0.0.0.0 --allow-root --NotebookApp.token=$LOGIN
