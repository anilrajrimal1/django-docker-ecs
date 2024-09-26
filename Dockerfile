FROM python:3.10.12-slim

ENV PYTHONUNBUFFERED=1

RUN mkdir -p /code

WORKDIR /code

COPY requirements.txt /code/

RUN pip install --no-cache-dir -r requirements.txt

COPY . /code/

CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000" ]