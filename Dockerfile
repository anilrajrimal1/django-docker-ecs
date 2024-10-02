FROM python:3.10.12-slim

ENV PYTHONUNBUFFERED=1

RUN mkdir -p /code

WORKDIR /code

COPY requirements.txt /code/

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/* && \
    apt autoremove && \
	apt autoclean

RUN pip install --no-cache-dir -r requirements.txt

COPY . /code/

CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000" ]
