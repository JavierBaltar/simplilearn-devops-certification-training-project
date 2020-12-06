FROM python:3.8
COPY script.py /tmp/
CMD ["python", "/tmp/script.py"]