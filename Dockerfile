FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y curl unzip
RUN apt-get install -y --reinstall python3-dev python3-pip python3.14-venv python3-full pipx
COPY requirements.txt .
RUN python3 -m venv myvenv/
RUN myvenv/bin/pip3 install --no-cache-dir --upgrade pip \
  && myvenv/bin/pip3 install --no-cache-dir -r requirements.txt
RUN curl -fsSL https://bun.sh/install | bash && ln -s $HOME/.bun/bin/bun /usr/local/bin/bun
COPY package.json bun.lock .
RUN bun install --frozen-lockfile
RUN pipx install uvicorn
COPY run.sh run.sh
COPY . .
EXPOSE 8000
RUN ["chmod", "+x", "run.sh"]
CMD ./run.sh
