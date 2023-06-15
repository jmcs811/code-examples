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
load("@vendor//Crypto/PublicKey/RSA", RSA="RSA")
load("@vendor//Crypto/Cipher/PKCS1_OAEP", PKCS1_OAEP="PKCS1_OAEP")


vault = {
    "tok_sandbox_8uLH3XdekgzSYa2mpiRwwi": "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjse1Rs21B0T8BcfxpYGZQ66V76P5UF2Z9Nwy5meNU2IBVUjSqRPq7jYd5kMTwijneFYBecal1MPQSf0V00Rw6jBiLfG60wKagpFXQbDnaTd6/57leTs+BL0Go1LFtHEuwO1xQRsCDhWvRHtGti5+h0hh8mQ3peU2PjME5MlQIMgTIi/xRBkaqt5T1T9UUrr0Q576z5oRoqg9zv7RtuJrgc5pD0iEEN7Nz8eI4xIUCncRujp3UN1DAUt6BXzKD0zb7sy2oleSXEjjKc5O3JD7mbLn8rHZ+HU/RRWICSy1x/9lBxaP/B132VY+DxnsuPgqUh8lGtB8U8XbqnYEL/wxwwIDAQAB",
    "tok_sandbox_wptPRsWr2N5hyXGvkZ8247": "MIIEpAIBAAKCAQEAjse1Rs21B0T8BcfxpYGZQ66V76P5UF2Z9Nwy5meNU2IBVUjSqRPq7jYd5kMTwijneFYBecal1MPQSf0V00Rw6jBiLfG60wKagpFXQbDnaTd6/57leTs+BL0Go1LFtHEuwO1xQRsCDhWvRHtGti5+h0hh8mQ3peU2PjME5MlQIMgTIi/xRBkaqt5T1T9UUrr0Q576z5oRoqg9zv7RtuJrgc5pD0iEEN7Nz8eI4xIUCncRujp3UN1DAUt6BXzKD0zb7sy2oleSXEjjKc5O3JD7mbLn8rHZ+HU/RRWICSy1x/9lBxaP/B132VY+DxnsuPgqUh8lGtB8U8XbqnYEL/wxwwIDAQABAoIBAE0ukcSzgG9skBwD6JHCS/p1TuHbLvONlaLywaUhRxlS+kuC8TWq6a1ZnbISgoTLnczEGUod4xjvvRGx+PFapvtBqmERsh9M4f9A1/1PxthuwFOcLonpR25CTGtPXEZdhJuP/0/lbKf2euc3CJOE8Krqqt/f4uEP1dGrvLJ8TI9bKXy5hPhCCSuAmhpnQfH9qx9wVpJmUo0+f6/AjhcZnoFzDpnnL3S5eXXveFvA94LOQrm+1QdYrTUq6p2j8npbOYoS55awdxfgLu024HYmlo6Vp+3mfVLpgJVWAGkHuDI0nNfT9MC3FUJ/UyV9QG0itfyk9hhamZICUsZ1evI2UMECgYEAxnhu/vHAdp8C81Zn9+RRaQFuwxMNXtEXIN+PtDeaSGUVU9nlRkT3WtCuCTJl8OEdIsQBeXqp8Fr2Iu7GNjh8St2/RtJaHTqL2fneO73OsbzhsZlhqsEBFk0/ZgeKUcCzDvYKuD9555Hs2O3TE2aDmPQjzuYR/w988KtQeYhPniECgYEAuCrBJNV6jqGkSaziLuta1Kzba0Zwd2Tisk4D2+TINWpdGAjEkyFndW3A+CmZa3XoEyLA0pvWUY9J0OrNnRCPk1zDv0YdfD1l5b9ZU1iEWwJIfYH8bpgVMNEdWSCGbIqbA5AN2sgM11nXYReIdndDpWU3K8PEC/ibO3nB+iRSq2MCgYEAxSWkvELQeASEHcvbAvcdlz0BFW27flActV7dlJsW+orOoLh1c1PWkbNw7VnOwXQcSQiCnnUmkccJcLHW2s1JSeTzuBoDwb0CZsg55QYqZ4vEdXJy/fcyaUDalTMwRv0v4NCu3U7QfSMLLoEvhrnyRuFdIIyRm9d6uGa0TcUFsYECgYBWM1TR+8XwisIN5gi8M1cBYqMVFBRCHgtpr9BolS4MqmtGe5wezazSLvv6a+YugTKN+l9MdLqc1DeVvMFeuciqDeplVdkpNMfEAIs70puoyWnKrRPNZAvPHKHi/LFOjpW91ihV9frktV11SYGLCYm1Gan4JxpVDBkEfpoHjgbPxwKBgQCylEkpBRiK/19yj1nZJEMAwfYGaziTLBUbQ2EzPLHp2DnpWYj2wbBgyQ4kObiltce9j2abU9PjhFMUmBkqPe5bc9PowNvRP2wX4CWR3Sw/gJxex3ixdqYaXeBEH/eJzghc24JN/Ux2wL9iz4JQjOKyEqW1kJ0OhwN4P0Z27CL5Cg=="
}


def process(input, ctx):    
    # reading body
    body_str = str(input.body)
    body = json.loads(body_str)
    
    # reading headers
    private_key = 'tok_sandbox_wptPRsWr2N5hyXGvkZ8247'
    public_key = 'tok_sandbox_8uLH3XdekgzSYa2mpiRwwi'
    
    # reveal of keys
    private_key = vault.get(private_key)
    public_key = vault.get(public_key)
    
    # Encryption part:
    message = bytes(body['message'], 'utf-8')
    # importing public key
    key = RSA.importKey(base64.b64decode(public_key))
    # encrypt
    cipher = PKCS1_OAEP.new(key)
    ciphertext = cipher.encrypt(message)
    # writing result into the body
    message_encrypted = base64.b64encode(ciphertext).decode('utf-8')
  
    # Decryption part:
    body_utf8 = base64.b64decode(bytes(message_encrypted, 'utf-8'))
    # importing private key
    key = RSA.importKey(base64.b64decode(private_key))
    # decrypt
    cipher = PKCS1_OAEP.new(key)
    message = cipher.decrypt(body_utf8)
    # writing result into the body
    body['message_decrypted'] = str(message)
  
    input.body = builtins.bytes(json.dumps(body))
    return input


def test_process():
    # keys below are not real (generated by randomizer)
    headers = {}
    body = b'{"message":"decrypt me if you can"}'
    input = VGSHttpRequest("https://test.com/post", data=body, headers=headers, method='POST')
    response = process(input, None)
    expected_body = b'{"message":"decrypt me if you can","message_decrypted":"decrypt me if you can"}'
    print(response.body)
    print(expected_body)
    asserts.assert_that(response.body).is_equal_to(expected_body)


def _testsuite():
  _suite = unittest.TestSuite()
  _suite.addTest(unittest.FunctionTestCase(test_process))
  return _suite

_runner = unittest.TextTestRunner()
_runner.run(_testsuite())