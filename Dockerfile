FROM python:3.10-slim

RUN apt-get update && apt-get install -y libpangocairo-1.0-0 && apt-get clean

COPY requirements.txt /
RUN pip install -U -r /requirements.txt

ENV USING_DOCKER yes
RUN useradd --system --no-create-home modmail
USER modmail

WORKDIR /modmailbot
CMD ["python", "bot.py"]
COPY --chown=modmail:modmail . /modmailbot
