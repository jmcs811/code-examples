# AES CBC sample of encryption in Larky (+HMAC)

This sample includes:
1. Larky test `.star` file that generates the same result due to static input values;
2. Ready-for-use YAML (Inbound Route) that produces the same result as Larky test.

## Testing part:

#### 1. Larky test:

To be able to run Larky locally, you'll need to setup your local environment:
https://www.verygoodsecurity.com/docs/larky/test-larky-locally

Example of run:

<img width="1366" alt="image" src="https://user-images.githubusercontent.com/78090218/190894314-c27f865e-ef12-4d29-a248-13a19a17cac9.png">

#### 2. YAML file:

Upload the YAML to your vault and run:
```
curl https://<VAULT_ID>.sandbox.verygoodproxy.com/post -k \
  -H "Content-type: application/json" \
  -d '{"ssn":"0987654321"}'
```

Expected response:
```
"json": {
    "ssn": "9/k9Y5B9XoPQ7LtMkIcttg==",
    "x-hmac": "0e951a70f6296acfe7c8adf66f6eee511661a0a953b405d26d9fa8192c0373e2"
  }
```
