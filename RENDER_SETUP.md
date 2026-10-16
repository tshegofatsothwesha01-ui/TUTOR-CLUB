Render deployment (manual steps)

1. Create a new Web Service on Render:
   - Connect your private repo (tshegofatsothwesha01-ui/TUTOR-CLUB).
   - Environment: Python
   - Build command: python -m py_compile app.py
   - Start command: python app.py --host 0.0.0.0 --port $PORT
   - Health check path: /health

2. Attach a persistent disk and set the mount path to /var/data.
   - In Render service settings, set the environment variable:
     TUTOR_CLUB_DATA_DIR=/var/data

3. Add environment variables in Render (do NOT commit these in Git):
   - DEMO_MODE=0
   - ADMIN_EMAIL=your-admin@example
   - ADMIN_PASSWORD=your-strong-password
   - PUBLIC_BASE_URL=https://your-final-domain
   - COOKIE_SECURE=1
   - TUTOR_CLUB_DATA_DIR=/var/data
   - PAYFAST_SANDBOX=1
   - PAYFAST_MERCHANT_ID=...
   - PAYFAST_MERCHANT_KEY=...
   - PAYFAST_PASSPHRASE=...

4. Keep the service to one instance while using SQLite. Test end-to-end with PayFast sandbox before going live.
