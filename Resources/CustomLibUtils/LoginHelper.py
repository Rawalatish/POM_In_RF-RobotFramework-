import random
import string

class LoginHelper:
    def generate_random_email(self, domain="gmail.com"):
        """Business Logic: Creates a unique email for every test run"""
        prefix = ''.join(random.choices(string.ascii_lowercase, k=8))
        return f"{prefix}@{domain}"
