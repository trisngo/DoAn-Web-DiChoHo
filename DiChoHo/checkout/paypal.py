from pathlib import Path
import environ
import os
from paypalcheckoutsdk.core import PayPalHttpClient, SandboxEnvironment

env = environ.Env()
# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent
environ.Env.read_env(os.path.join(BASE_DIR.parent, '.env'))

class PayPalClient:
    def __init__(self):
        self.client_id = env('PAYPAL_CLIENT_ID')
        self.client_secret = env('PAYPAL_CLIENT_SECRET')
        self.environment = SandboxEnvironment(client_id=self.client_id, client_secret=self.client_secret)
        self.client = PayPalHttpClient(self.environment)
