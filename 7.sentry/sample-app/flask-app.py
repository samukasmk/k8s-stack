# app.py
import os
import math
import time
import random

from flask import Flask, jsonify
import sentry_sdk
from sentry_sdk.integrations.flask import FlaskIntegration

# --- Configuração Sentry (Tracing + Profiling) ---
# Defina o DSN via env var SENTRY_DSN ou substitua abaixo.
SENTRY_DSN = os.getenv("SENTRY_DSN", "http://f0ab6a97defcaf2d13adfa30cec3119e@sentry.127.0.0.1.nip.io/2")

sentry_sdk.init(
    dsn=SENTRY_DSN,
    integrations=[FlaskIntegration()],
    # Tracing/Performance
    traces_sample_rate=1.0,          # 100% das transactions
    # Profiling (baseado em transaction)
    profiles_sample_rate=1.0,        # 100% dos perfis
    # Opcionalmente, identifique release e ambiente
    environment=os.getenv("SENTRY_ENVIRONMENT", "local"),
    release=os.getenv("SENTRY_RELEASE", "flask-demo@1.0.0"),
)

from sentry_sdk import start_span  # depois do init

app = Flask(__name__)

@app.route("/")
def index():
    return jsonify(status="ok", message="Hello, Sentry!"), 200

@app.route("/work")
def do_work():
    # Cria spans filhos dentro da transaction aberta pela integração Flask
    with start_span(op="compute", description="simulate cpu-bound work"):
        # Faz um trabalho CPU-bound simples
        total = 0.0
        for i in range(1, 20000):
            total += math.sqrt(i) * math.sin(i / 10.0)

    with start_span(op="io", description="simulate io-bound sleep"):
        time.sleep(0.2 + random.random() * 0.3)

    return jsonify(status="ok", total=total), 200

@app.route("/error")
def explode():
    # Gera uma exceção para confirmar o envio de eventos
    raise RuntimeError("Explodiu só para teste!")

if __name__ == "__main__":
    # Para testes locais, o servidor de desenvolvimento já basta.
    # Em produção, rode sob gunicorn/uvicorn com threads/workers apropriados.
    app.run(host="0.0.0.0", port=int(os.getenv("PORT", "8000")), debug=False)
