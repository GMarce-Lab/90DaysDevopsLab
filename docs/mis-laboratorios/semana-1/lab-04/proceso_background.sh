#!/bin/bash

lento() {
  echo "Iniciando tarea lenta..."
  sleep 5
  echo "Tarea finalizada"
}

lento &
pid=$!
wait $pid
