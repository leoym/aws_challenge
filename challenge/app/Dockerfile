FROM python:3
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
RUN ls 
RUN python ./teste.py
#CMD [ "python3", "./main.py" ]
RUN export FLASK_APP=app
CMD [ "flask", "run", "--host=0.0.0.0", "--port=5000"  ]