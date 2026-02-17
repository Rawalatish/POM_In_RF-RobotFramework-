import random
import string
from robot.api.deco import keyword

class LoginHelper:
    @keyword("Random Email")
    def generate_random_email(self, domain="gmail.com"):
        """Business Logic: Creates a unique email for every test run"""
        prefix = ''.join(random.choices(string.ascii_lowercase, k=8))
        return f"{prefix}@{domain}"
