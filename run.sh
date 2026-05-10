#!/bin/bash
myvenv/bin/python3 -m uvicorn backend.main:app  --host 0.0.0.0 --port 8000 --reload --log-level debug &
bun run start
wait -n
exit $?
