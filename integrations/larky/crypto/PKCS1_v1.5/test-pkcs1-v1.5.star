load("@stdlib//unittest", "unittest")
load("@vendor//asserts", "asserts")
load("@stdlib//hashlib", "hashlib")
load("@stdlib//binascii", "binascii")
load("@vgs//vault", "vault")
load("@vgs//http/request", "VGSHttpRequest")
load("@stdlib//builtins", builtins="builtins")
load("@stdlib//base64", base64="base64")
load("@stdlib//json", json="json")
load("@stdlib//larky", larky="larky")
load("@stdlib//operator", operator="operator")
load("@vendor//Crypto/Cipher/PKCS1_v1_5",PKCS1_v1_5="PKCS1_v1_5_Cipher")
load("@vendor//Crypto/PublicKey/RSA", RSA="RSA")


vault = {
    "tok_sandbox_8uLH3XdekgzSYa2mpiRwwi": "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjse1Rs21B0T8BcfxpYGZQ66V76P5UF2Z9Nwy5meNU2IBVUjSqRPq7jYd5kMTwijneFYBecal1MPQSf0V00Rw6jBiLfG60wKagpFXQbDnaTd6/57leTs+BL0Go1LFtHEuwO1xQRsCDhWvRHtGti5+h0hh8mQ3peU2PjME5MlQIMgTIi/xRBkaqt5T1T9UUrr0Q576z5oRoqg9zv7RtuJrgc5pD0iEEN7Nz8eI4xIUCncRujp3UN1DAUt6BXzKD0zb7sy2oleSXEjjKc5O3JD7mbLn8rHZ+HU/RRWICSy1x/9lBxaP/B132VY+DxnsuPgqUh8lGtB8U8XbqnYEL/wxwwIDAQAB",
    "tok_sandbox_a4JULYBMphkeL2iV7ipwdL": "4111111111111111",
    "tok_sandbox_wptPRsWr2N5hyXGvkZ8247": "MIIEpAIBAAKCAQEAjse1Rs21B0T8BcfxpYGZQ66V76P5UF2Z9Nwy5meNU2IBVUjSqRPq7jYd5kMTwijneFYBecal1MPQSf0V00Rw6jBiLfG60wKagpFXQbDnaTd6/57leTs+BL0Go1LFtHEuwO1xQRsCDhWvRHtGti5+h0hh8mQ3peU2PjME5MlQIMgTIi/xRBkaqt5T1T9UUrr0Q576z5oRoqg9zv7RtuJrgc5pD0iEEN7Nz8eI4xIUCncRujp3UN1DAUt6BXzKD0zb7sy2oleSXEjjKc5O3JD7mbLn8rHZ+HU/RRWICSy1x/9lBxaP/B132VY+DxnsuPgqUh8lGtB8U8XbqnYEL/wxwwIDAQABAoIBAE0ukcSzgG9skBwD6JHCS/p1TuHbLvONlaLywaUhRxlS+kuC8TWq6a1ZnbISgoTLnczEGUod4xjvvRGx+PFapvtBqmERsh9M4f9A1/1PxthuwFOcLonpR25CTGtPXEZdhJuP/0/lbKf2euc3CJOE8Krqqt/f4uEP1dGrvLJ8TI9bKXy5hPhCCSuAmhpnQfH9qx9wVpJmUo0+f6/AjhcZnoFzDpnnL3S5eXXveFvA94LOQrm+1QdYrTUq6p2j8npbOYoS55awdxfgLu024HYmlo6Vp+3mfVLpgJVWAGkHuDI0nNfT9MC3FUJ/UyV9QG0itfyk9hhamZICUsZ1evI2UMECgYEAxnhu/vHAdp8C81Zn9+RRaQFuwxMNXtEXIN+PtDeaSGUVU9nlRkT3WtCuCTJl8OEdIsQBeXqp8Fr2Iu7GNjh8St2/RtJaHTqL2fneO73OsbzhsZlhqsEBFk0/ZgeKUcCzDvYKuD9555Hs2O3TE2aDmPQjzuYR/w988KtQeYhPniECgYEAuCrBJNV6jqGkSaziLuta1Kzba0Zwd2Tisk4D2+TINWpdGAjEkyFndW3A+CmZa3XoEyLA0pvWUY9J0OrNnRCPk1zDv0YdfD1l5b9ZU1iEWwJIfYH8bpgVMNEdWSCGbIqbA5AN2sgM11nXYReIdndDpWU3K8PEC/ibO3nB+iRSq2MCgYEAxSWkvELQeASEHcvbAvcdlz0BFW27flActV7dlJsW+orOoLh1c1PWkbNw7VnOwXQcSQiCnnUmkccJcLHW2s1JSeTzuBoDwb0CZsg55QYqZ4vEdXJy/fcyaUDalTMwRv0v4NCu3U7QfSMLLoEvhrnyRuFdIIyRm9d6uGa0TcUFsYECgYBWM1TR+8XwisIN5gi8M1cBYqMVFBRCHgtpr9BolS4MqmtGe5wezazSLvv6a+YugTKN+l9MdLqc1DeVvMFeuciqDeplVdkpNMfEAIs70puoyWnKrRPNZAvPHKHi/LFOjpW91ihV9frktV11SYGLCYm1Gan4JxpVDBkEfpoHjgbPxwKBgQCylEkpBRiK/19yj1nZJEMAwfYGaziTLBUbQ2EzPLHp2DnpWYj2wbBgyQ4kObiltce9j2abU9PjhFMUmBkqPe5bc9PowNvRP2wX4CWR3Sw/gJxex3ixdqYaXeBEH/eJzghc24JN/Ux2wL9iz4JQjOKyEqW1kJ0OhwN4P0Z27CL5Cg=="
}


def encrypt(key, text):
    cipher = PKCS1_v1_5.new(key)
    ciphertext = cipher.encrypt(text)
    return ciphertext

def decrypt(key, ciphertext):
    cipher = PKCS1_v1_5.new(key)
    sentinel = 'Error'
    text = cipher.decrypt(ciphertext, sentinel)
    return text

def process(input, ctx):    
    private_key = 'tok_sandbox_wptPRsWr2N5hyXGvkZ8247'
    public_key = 'tok_sandbox_8uLH3XdekgzSYa2mpiRwwi'

    body = json.loads(str(input.body))
    card_number = vault.get(body['card_number'])
    exp_date = body['exp_date']
    
    # encryption part:
    encryption_key = vault.get(public_key)
    key = RSA.importKey(base64.b64decode(encryption_key))
    encrypted_card = base64.b64encode(encrypt(key, bytearray(card_number, 'utf-8'))).decode('utf-8')
    encrypted_date = base64.b64encode(encrypt(key, bytearray(exp_date, 'utf-8'))).decode('utf-8')

    # decryption part:
    decryption_key = vault.get(private_key)
    key = RSA.importKey(base64.b64decode(decryption_key))
    body['decrypted_card'] = str(decrypt(key, base64.b64decode(bytes(encrypted_card, 'utf-8'))))
    body['decrypted_date'] = str(decrypt(key, base64.b64decode(bytes(encrypted_date, 'utf-8'))))

    input.body = builtins.bytes(json.dumps(body))
    return input


def test_process():
    # keys below are not real (generated by randomizer)
    headers = {}
    body = b'{"card_number": "tok_sandbox_a4JULYBMphkeL2iV7ipwdL", "exp_date": "1234"}'
    input = VGSHttpRequest("https://test.com/post", data=body, headers=headers, method='POST')
    response = process(input, None)
    expected_body = b'{"card_number":"tok_sandbox_a4JULYBMphkeL2iV7ipwdL","decrypted_card":"4111111111111111","decrypted_date":"1234","exp_date":"1234"}'
    print(response.body)
    print(expected_body)
    asserts.assert_that(response.body).is_equal_to(expected_body)


def _testsuite():
  _suite = unittest.TestSuite()
  _suite.addTest(unittest.FunctionTestCase(test_process))
  return _suite

_runner = unittest.TextTestRunner()
_runner.run(_testsuite())
