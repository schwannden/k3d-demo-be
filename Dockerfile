FROM python:3.11-bullseye

WORKDIR /app

COPY ./pyproject.toml /app/pyproject.toml

RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir poetry
RUN poetry env use system
RUN poetry install

COPY ./k3d_demo_be /app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "5000"]
