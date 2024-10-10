# Установка poetry в докере

FROM python:3.10

ENV POETRY_HOME='/usr/local'
ENV POETRY_VIRTUALENVS_CREATE=false
ENV POETRY_NO_INTERACTION=1
ENV POETRY_VERSION=1.8.3

RUN mkdir /admin_panel

WORKDIR /admin_panel

COPY poetry.lock poetry.lock
COPY pyproject.toml pyproject.toml

RUN poetry install --no-interaction --no-root --no-directory

COPY . .

CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]
