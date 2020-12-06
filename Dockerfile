FROM python:3.8
COPY app/script.py /tmp/
CMD ["python", "/tmp/script.py"]