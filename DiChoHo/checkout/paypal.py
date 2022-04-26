from paypalcheckoutsdk.core import PayPalHttpClient, SandboxEnvironment

class PayPalClient:
    def __init__(self):
        self.client_id = "AcVxd-V9bfaFskp7zOXSZpUoqnIvDnBRwAGWa7MfF9EcNqaCj9Gq62nOvmg9LZoffWM6GyQJj5miHNJQ"
        self.client_secret = "EG4AueIAdmAtnb8Abbx3q-nMjf3Yl_PPTbCAzv0tDvgBBDD89dxgZBEnaXPtZnh6O2TnHYdW8Fajpity"
        self.environment = SandboxEnvironment(client_id=self.client_id, client_secret=self.client_secret)
        self.client = PayPalHttpClient(self.environment)
