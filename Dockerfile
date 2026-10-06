FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY train.py app.py ./

# Run model training during the image build step so iris_model.joblib is saved inside the image
RUN python train.py

EXPOSE 5000

# Startup command when container starts
CMD ["python", "app.py"]