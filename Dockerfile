FROM python:3.10-slim

RUN apt-get update && apt-get install gcc g++ git make -y
RUN useradd -m -u 1000 user
USER user
ENV HOME=/home/user \
    PATH=/home/user/.local/bin:$PATH

WORKDIR $HOME/app

COPY --chown=user . $HOME/app

RUN pip install 'langflow==0.5.6' langchain langchain-experimental gigachain 'gpt4all==2.0.2' -U --user
CMD ["langflow", "run", "--host", "0.0.0.0", "--port", "7860"]
